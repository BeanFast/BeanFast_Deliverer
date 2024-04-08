import 'package:beanfast_deliverer/views/screens/order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OrderDeliveryListScreen extends StatelessWidget {
  const OrderDeliveryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Delivery List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            10,
            (index) => GestureDetector(
              onTap: () {
                Get.to( const OrderDetailScreen());
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
                      Text('ID: #$index'),
                      Text('Tên khách hàng $index'),
                    ],
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Số sản phẩm: $index'),
                      Text('Tổng giá: 200.000$indexđ'),
                    ],
                  ),
                  trailing: IconButton(
                     icon: const Icon(Iconsax.arrow_right),
                    onPressed: () {
                       Get.to( const OrderDetailScreen());
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
