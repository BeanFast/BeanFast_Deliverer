import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'package:beanfast_deliverer/controllers/delivery_schedule_controller.dart';
import 'package:beanfast_deliverer/views/screens/loading_screen.dart';
import 'package:beanfast_deliverer/views/screens/order_delivery_list.dart';

class DeliveryScheduleScreen extends GetView<DeliveryScheduleController> {
  const DeliveryScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryScheduleController());
    return LoadingScreen(
      future: controller.getDeliveryschedule,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: controller.map.entries
                  .map(
                    (session) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Card(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: ExpansionPanelList(
                                expandIconColor: Colors.black,
                                expansionCallback: (int indexexpansionCallback,
                                    bool isExpanded) {
                                  controller
                                          .panelVisibility[session.key]!.value =
                                      !controller
                                          .panelVisibility[session.key]!.value;
                                },
                                children: [
                                  ExpansionPanel(
                                    backgroundColor: Colors.blueGrey[200],
                                    headerBuilder: (BuildContext context,
                                        bool isExpanded) {
                                      return GestureDetector(
                                        onTap: () {
                                          controller
                                              .panelVisibility[session.key]!
                                              .value = !isExpanded;
                                        },
                                        child: Container(
                                          height: 60,
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            session.key,
                                            style: Get.textTheme.bodyLarge,
                                          ),
                                        ),
                                      );
                                    },
                                    body: Column(
                                      children: session.value.entries
                                          .map(
                                            (sessionDetail) => GestureDetector(
                                              onTap: () {
                                                Get.to(OrderDeliveryListScreen(
                                                    list: sessionDetail
                                                        .value.orders!));
                                              },
                                              child: Card(
                                                shadowColor: Colors.white,
                                                elevation: 1,
                                                child: ListTile(
                                                  leading: const Icon(
                                                      Iconsax.location),
                                                  title: Text(DateFormat(
                                                              'dd/MM/yy - ')
                                                          .format(sessionDetail
                                                              .value
                                                              .session!
                                                              .deliveryStartTime!) +
                                                      DateFormat('dd/MM/yy')
                                                          .format(sessionDetail
                                                              .value
                                                              .session!
                                                              .deliveryEndTime!)),
                                                  subtitle: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(sessionDetail
                                                          .value
                                                          .location!
                                                          .school!
                                                          .name
                                                          .toString()),
                                                      Text(sessionDetail
                                                          .value.location!.name
                                                          .toString()),
                                                      Text(
                                                          'Số đơn hàng: ${sessionDetail.value.orders!.length.toString()}'),
                                                    ],
                                                  ),
                                                  trailing: IconButton(
                                                    icon: const Icon(
                                                        Iconsax.arrow_right),
                                                    onPressed: () {
                                                      Get.to(
                                                          OrderDeliveryListScreen(
                                                              list: sessionDetail
                                                                  .value
                                                                  .orders!));
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                    isExpanded: controller
                                        .panelVisibility[session.key]!.value,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
