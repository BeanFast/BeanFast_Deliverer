import 'package:beanfast_deliverer/models/exchange_gift.dart';
import 'package:beanfast_deliverer/views/screens/exchange_gift_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/models/order.dart';
import '/utils/formater.dart';
import 'data_screen.dart';
import 'order_detail_screen.dart';

class OrderDeliveryListScreen extends StatelessWidget {
  final List<Order> orderList;
  final List<ExchangeGift> exchangeGiftList;
  final bool deliverable;

  const OrderDeliveryListScreen(
      {super.key, required this.orderList, required this.exchangeGiftList, required this.deliverable});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn hàng cần giao'),
      ),
      body: DataScreen(
        hasData: orderList.isNotEmpty || exchangeGiftList.isNotEmpty,
        message: 'Không có đơn hàng nào được giao',
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: orderList
                    .map(
                      (order) => GestureDetector(
                        onTap: () {
                          Get.off(
                            OrderDetailScreen(
                              orderId: order.id!,
                              deliverable: deliverable,
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          shadowColor: Colors.white,
                          elevation: 1,
                          child: ListTile(
                            leading: const Icon(Iconsax.box_tick),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ID: #${order.code}'),
                                Text(
                                    'Tên khách hàng: ${order.profile!.user!.fullName}'),
                                Text(
                                    'Tên học sinh: ${order.profile!.fullName}'),
                              ],
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Số sản phẩm: ${order.orderDetails!.length}'),
                                Text(
                                    'Tổng giá: ${Formater.formatMoney(order.totalPrice.toString())}'),
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
              Column(
                children: exchangeGiftList
                    .map(
                      (exchangeGift) => GestureDetector(
                        onTap: () {
                          Get.off(
                            ExchangeGiftDetailScreen(
                              exchangeGiftId: exchangeGift.id!,
                              deliverable: deliverable,
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          shadowColor: Colors.white,
                          elevation: 1,
                          child: ListTile(
                            leading: const Icon(Iconsax.gift),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ID: #${exchangeGift.code}'),
                                Text(
                                    'Tên khách hàng: ${exchangeGift.profile!.user!.fullName}'),
                                Text(
                                    'Tên học sinh: ${exchangeGift.profile!.fullName}'),
                              ],
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    'Số sản phẩm: 1'),
                                Text(
                                    'Tổng điểm: ${Formater.formatMoney(exchangeGift.points.toString())}'),
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
            ],
          ),
        ),
      ),
    );
  }
}
