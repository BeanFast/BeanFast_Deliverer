import 'package:beanfast_deliverer/views/widgets/is_empty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/models/order.dart';
import '/utils/formater.dart';
import '/views/screens/order_detail_screen.dart';

class OrderDeliveryListScreen extends StatelessWidget {
  final List<Order> list;
  const OrderDeliveryListScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn hàng cần giao'),
      ),
      body: list.isEmpty
          ? const Center(
              child: Text('Không có đơn hàng nào để giao cho khách hàng này'),
            )
          : SingleChildScrollView(
              child: Column(
                children: list
                    .map(
                      (order) => GestureDetector(
                        onTap: () {
                          Get.off(
                            OrderDetailScreen(
                              orderId: order.id!,
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
                                Text('Tên khách hàng ${order.code}'),
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
                            trailing: IconButton(
                              icon: const Icon(Iconsax.arrow_right),
                              onPressed: () {
                                Get.to(OrderDetailScreen(
                                  orderId: order.id!,
                                ));
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
    );
  }
}
