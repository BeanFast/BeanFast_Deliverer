import 'package:beanfast_deliverer/views/screens/order_delivery_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DeliverySchedulesScreen extends StatelessWidget {
  const DeliverySchedulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DeliverySchedulesController controller =
        Get.put(DeliverySchedulesController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            2,
            (index) => Column(
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
                            (int indexexpansionCallback, bool isExpanded) {
                          controller.panelVisibility[index].value =
                              !controller.panelVisibility[index].value;
                        },
                        children: [
                          ExpansionPanel(
                            backgroundColor: Colors.blueGrey[200],
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return GestureDetector(
                                onTap: () {
                                  controller.panelVisibility[index].value =
                                      !isExpanded;
                                },
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '$index 30/4/1975',
                                    style: Get.textTheme.bodyLarge,
                                  ),
                                ),
                              );
                            },
                            body: Column(
                              children: List.generate(
                                10,
                                (index) => GestureDetector(
                                  onTap: () {
                                    Get.to(const OrderDeliveryListScreen());
                                  },
                                  child: Card(
                                    shadowColor: Colors.white,
                                    elevation: 1,
                                    child: ListTile(
                                      leading: const Icon(Iconsax.location),
                                      title: Text('Day $index'),
                                      subtitle: Text('Location $index'),
                                      trailing: IconButton(
                                        icon: const Icon(Iconsax.arrow_right),
                                        onPressed: () {
                                          Get.to(
                                              const OrderDeliveryListScreen());
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            isExpanded: controller.panelVisibility[index].value,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeliverySchedulesController extends GetxController {
  var panelVisibility = List<RxBool>.generate(
      2, (_) => true.obs); // 2 is the number of ExpansionPanelList
}
