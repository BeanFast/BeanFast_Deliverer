import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '/views/widgets/banner_order_status.dart';
import '/views/widgets/image_default.dart';
import '/contrains/theme_color.dart';
import '/controllers/order_controller.dart';
import '/utils/formater.dart';
import 'loading_screen.dart';

class OrderDetailScreen extends GetView<OrderController> {
  const OrderDetailScreen(
      {super.key, required this.orderId, required this.deliverable});
  final String orderId;
  final bool deliverable;

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết đơn hàng'),
      ),
      body: LoadingScreen(
        future: () => controller.getById(orderId),
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BannerOrderStatus(
                  order: controller.model.value,
                ),
                Container(
                  color: ThemeColor.itemColor,
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      // Get.to(const OrderTimeline());
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Iconsax.location, size: 20),
                                const SizedBox(width: 8),
                                Text('Địa chỉ nhận hàng',
                                    style: Get.textTheme.labelLarge),
                              ],
                            ),
                            Text(
                                controller.model.value.sessionDetail!.location!
                                    .school!.name!,
                                style: Get.textTheme.bodySmall),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              controller
                                  .model.value.sessionDetail!.location!.name!,
                              style: Get.textTheme.bodySmall),
                        ),
                        const SizedBox(height: 5),
                        if (controller.model.value.deliveryDate != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Iconsax.truck_fast, size: 20),
                                  const SizedBox(width: 8),
                                  Text('Thông tin vận chuyển',
                                      style: Get.textTheme.labelLarge),
                                ],
                              ),
                              Text(
                                  DateFormat('hh:mm dd/MM/yy').format(
                                      controller.model.value.deliveryDate!),
                                  style: Get.textTheme.bodySmall),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: ThemeColor.itemColor,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              controller.model.value.profile!.fullName
                                  .toString(),
                              style: Get.textTheme.titleSmall),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Column(
                        children: controller.model.value.orderDetails!
                            .map(
                              (orderDetail) => Column(
                                children: [
                                  SizedBox(
                                    height: 80,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomNetworkImage(
                                          orderDetail.food!.imagePath
                                              .toString(),
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              130,
                                          height: 80,
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  orderDetail.food!.name
                                                      .toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      Get.textTheme.bodyMedium),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                    'x${orderDetail.quantity}',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Get
                                                        .textTheme.bodySmall),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                    Formater.formatMoney(
                                                        orderDetail.price
                                                            .toString()),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Get
                                                        .textTheme.bodySmall!
                                                        .copyWith(
                                                            color: Colors.red)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(thickness: 1),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${controller.model.value.orderDetails!.length.toString()} sản phẩm',
                            style: Get.textTheme.bodySmall,
                          ),
                          Row(
                            children: [
                              Text(
                                'Thành tiền ',
                                style: Get.textTheme.bodySmall,
                              ),
                              Text(
                                Formater.formatMoney(controller
                                    .model.value.totalPrice
                                    .toString()),
                                style: Get.textTheme.bodySmall!
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: ThemeColor.itemColor,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Mã đơn hàng', style: Get.textTheme.bodyMedium),
                          Text('#${controller.model.value.code.toString()}',
                              style: Get.textTheme.bodySmall),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Thời gian đặt hàng',
                              style: Get.textTheme.bodyMedium),
                          Text(
                              DateFormat('hh:mm dd/MM/yy')
                                  .format(controller.model.value.paymentDate!),
                              style: Get.textTheme.bodySmall),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: deliverable,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: Get.width / 1.2,
                      height: Get.height / 15,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 109, 177, 121),
                            Colors.green,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          await controller.completeOrderStatus(orderId);
                        },
                        child: const Text('Xác nhận giao hàng',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
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

  void showSuccessDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          // Return object of type Dialog
          return AlertDialog(
            content: SizedBox(
              height: 180,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Lottie.asset(
                      "assets/success.json",
                      repeat: false,
                      animate: true,
                    ),
                  ),
                  const Text(
                    'Giao hàng thành công !',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
