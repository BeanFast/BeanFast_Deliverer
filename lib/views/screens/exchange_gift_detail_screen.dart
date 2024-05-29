import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '/contrains/theme_color.dart';
import '/controllers/exchange_gift_controller.dart';
import '/views/widgets/banner_exchange_gift_status.dart';
import '/views/widgets/image_default.dart';
import '/utils/formater.dart';
import 'data_screen.dart';
import 'loading_screen.dart';

class ExchangeGiftDetailScreen extends GetView<ExchangeGiftController> {
  const ExchangeGiftDetailScreen(
      {super.key, required this.exchangeGiftId, required this.deliverable});
  final String exchangeGiftId;
  final bool deliverable;

  @override
  Widget build(BuildContext context) {
    Get.put(ExchangeGiftController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết đơn hàng'),
      ),
      body: LoadingScreen(
        future: () => controller.getById(exchangeGiftId),
        child: Obx(
          () => DataScreen(
            hasData: controller.model.value != null,
            message: 'Chưa có dữ liệu',
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BannerExchangeGiftStatus(
                    exchangeGift: controller.model.value!,
                  ),
                  Container(
                    color: ThemeColor.itemColor,
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        // Get.to( () => OrderTimeline(
                        //   order: controller.model.value,
                        // ));
                      },
                      child: Container(
                        color: ThemeColor.itemColor,
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Iconsax.location),
                              title: const Text('Địa chỉ nhận hàng'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.model.value!.sessionDetail!
                                      .location!.school!.name
                                      .toString()),
                                  Text(controller.model.value!.sessionDetail!
                                      .location!.name
                                      .toString()),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            if (controller.model.value!.sessionDetail!.session!
                                        .deliveryStartTime !=
                                    null &&
                                controller.model.value!.sessionDetail!.session!
                                        .deliveryEndTime !=
                                    null)
                              ListTile(
                                leading: const Icon(Iconsax.truck_time),
                                title: Text('Thời gian nhận hàng',
                                    style: Get.textTheme.bodyMedium),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Từ ${DateFormat('HH:mm').format(controller.model.value!.sessionDetail!.session!.deliveryStartTime!)} đến ${DateFormat('HH:mm, dd/MM/yy').format(controller.model.value!.sessionDetail!.session!.deliveryEndTime!)}",
                                        style: Get.textTheme.bodyMedium),
                                  ],
                                ),
                              ),
                          ],
                        ),
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
                                controller.model.value!.profile!.fullName
                                    .toString(),
                                style: Get.textTheme.titleSmall),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children: [
                            SizedBox(
                              height: 80,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomNetworkImage(
                                    controller.model.value!.gift!.imagePath!,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    width: Get.width - 100,
                                    height: 80,
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            controller.model.value!.gift!.name
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Get.textTheme.bodyMedium),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text('x1',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Get.textTheme.bodySmall),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            Formater.formatPoint(
                                              controller.model.value!.points
                                                  .toString(),
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Get.textTheme.bodySmall!
                                                .copyWith(
                                              color: const Color.fromARGB(
                                                  255, 26, 128, 30),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(thickness: 1, color: Colors.grey),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1 sản phẩm',
                              style: Get.textTheme.bodySmall,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Tổng ',
                                  style: Get.textTheme.bodySmall,
                                ),
                                Text(
                                  Formater.formatPoint(controller
                                      .model.value!.points
                                      .toString()),
                                  style: Get.textTheme.bodySmall!.copyWith(
                                    color:
                                        const Color.fromARGB(255, 26, 128, 30),
                                  ),
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
                            Text('Mã đơn hàng',
                                style: Get.textTheme.bodyMedium),
                            GestureDetector(
                              onTap: () {
                                Get.snackbar(
                                    'Hệ thống', 'Đã sao chép mã đơn hàng',
                                    snackPosition: SnackPosition.TOP);
                                Clipboard.setData(ClipboardData(
                                    text: controller.model.value!.code
                                        .toString()));
                              },
                              child: Text(
                                  '#${controller.model.value!.code.toString()}',
                                  style: Get.textTheme.bodySmall),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Thời gian đặt hàng',
                                style: Get.textTheme.bodyMedium),
                            Text(
                                DateFormat('hh:mm dd/MM/yy').format(
                                    controller.model.value!.paymentDate!),
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
                            await controller
                                .completeOrderStatus(exchangeGiftId);
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
      ),
    );
  }
}
