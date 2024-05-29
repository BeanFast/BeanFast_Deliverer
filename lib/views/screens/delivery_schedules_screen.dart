import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '/utils/constants.dart';
import '/controllers/delivery_schedule_controller.dart';
import 'data_screen.dart';
import 'loading_screen.dart';
import 'order_delivery_list.dart';

class DeliveryScheduleScreen extends GetView<DeliveryScheduleController> {
  const DeliveryScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryScheduleController());
    return Scaffold(
      appBar: AppBar(
        actions: headerActionWidget(),
      ),
      body: LoadingScreen(
        future: controller.fetchData,
        child: Obx(
          () => DataScreen(
            hasData: controller.map.isNotEmpty,
            message: 'Không có lịch giao hàng nào',
            child: SingleChildScrollView(
              child: Column(
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
                                  expansionCallback:
                                      (int indexexpansionCallback,
                                          bool isExpanded) {
                                    controller.panelVisibility[session.key]!
                                            .value =
                                        !controller
                                            .panelVisibility[session.key]!
                                            .value;
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
                                              (sessionDetail) =>
                                                  GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                    OrderDeliveryListScreen(
                                                      orderList: sessionDetail
                                                          .value.orders!,
                                                      exchangeGiftList:
                                                          sessionDetail.value
                                                              .exchangeGifts!,
                                                      deliverable: sessionDetail
                                                              .value
                                                              .session!
                                                              .deliveryStartTime!
                                                              .isBefore(DateTime
                                                                  .now()) &&
                                                          sessionDetail
                                                              .value
                                                              .session!
                                                              .deliveryEndTime!
                                                              .isAfter(DateTime
                                                                  .now()),
                                                    ),
                                                  );
                                                },
                                                child: Card(
                                                  shadowColor: Colors.white,
                                                  elevation: 1,
                                                  child: ListTile(
                                                    leading: const Icon(
                                                        Iconsax.location),
                                                    title: Text(DateFormat(
                                                                'HH:mm - ')
                                                            .format(sessionDetail
                                                                .value
                                                                .session!
                                                                .deliveryStartTime!) +
                                                        DateFormat(
                                                                'HH:mm -- dd/MM/yyyy')
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
                                                        Text(sessionDetail.value
                                                            .location!.name
                                                            .toString()),
                                                        Text(
                                                            'Số đơn hàng: ${sessionDetail.value.orders!.length.toString()}'),
                                                        Text(
                                                            'Số đơn quà: ${sessionDetail.value.exchangeGifts!.length.toString()}'),
                                                      ],
                                                    ),
                                                    trailing: const Icon(
                                                        Iconsax.arrow_right_3),
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
      ),
    );
  }

  List<Widget> headerActionWidget() {
    return <Widget>[
      GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            width: Get.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: currentUser.value == null
                          ? Image.asset('assets/images/image_not_available.png')
                          : Image.network(
                              currentUser.value!.avatarPath!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                    )),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Text(
                            currentUser.value == null
                                ? 'Chưa có thông tin'
                                : currentUser.value!.fullName!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Get.textTheme.bodyMedium!.copyWith(
                              color: Colors.green,
                            ),
                          )),
                      Text(
                        'BeanFast giao hàng viên',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodySmall!.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      const Spacer(),
    ];
  }
}
