import 'package:beanfast_deliverer/views/screens/qr_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/utils/constants.dart';
import 'account_screen.dart';
import 'notification_screen.dart';
import 'order_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [const OrderScreen(), const AccountScreen()];
    return Scaffold(
      appBar: AppBar(
        actions: headerActionWidget(),
      ),
      body: Obx(() => screens[selectedMenuIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: selectedMenuIndex.value,
          onTap: changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: 'Đơn hàng',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Tôi',
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> headerActionWidget() {
  return <Widget>[
    Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 50,
          height: 50,
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.notifications_outlined, size: 30),
              onPressed: () {
                Get.to(const NotificationScreen());
              },
            ),
          ),
        ),
        Visibility(
          visible: true,
          child: Positioned(
            top: 5,
            right: 3,
            width: 20,
            height: 20,
            child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: const Center(
                  child: Text(
                    '99+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 50,
          height: 50,
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.qr_code_scanner_outlined, size: 30),
              onPressed: () {
                Get.to(QRScanScreen());
              },
            ),
          ),
        ),
      ],
    ),
  ];
}
