import '/enums/status_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/order_controller.dart';
import 'order_tabview.dart';

class OrderScreen extends GetView<OrderController> {
  const OrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return const Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Đang giao'),
                Tab(text: 'Đã giao'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  OrderTabBarView(
                    orderStatus: OrderStatus.preparing,
                  ), // Đang giao
                  OrderTabBarView(
                    orderStatus: OrderStatus.delivering,
                  ), // Đã giao
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderCancelledTab extends StatelessWidget {
  const OrderCancelledTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('OrderCancelledTab'),
    );
  }
}

class OrderCompletedTab extends StatelessWidget {
  const OrderCompletedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('OrderCompletedTab'),
    );
  }
}
