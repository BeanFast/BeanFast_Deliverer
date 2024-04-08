import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:beanfast_deliverer/views/screens/delivery_schedules_screen.dart';
import 'package:beanfast_deliverer/views/screens/qr_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/utils/constants.dart';
import 'account_screen.dart';
import 'notification_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const DeliverySchedulesScreen(),
      const AccountScreen()
    ];
    //  final List<Widget> screens = [const OrderScreen(), const AccountScreen()];
    return Scaffold(
      appBar: AppBar(
        actions: headerActionWidget(),
      ),
      body: Obx(() => screens[selectedMenuIndex.value]),
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          activeIndex: selectedMenuIndex.value,
          onTap: changePage,
          icons: const [Icons.assignment_outlined, Iconsax.profile_circle],
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.defaultEdge,
          activeColor: Colors.green,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const QRScanScreen());
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        backgroundColor: Colors.green.withOpacity(0.5),
        child: const Icon(
          Iconsax.scan_barcode,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

List<Widget> headerActionWidget() {
  return <Widget>[
    GestureDetector(
      onTap: () {
        Get.snackbar('title', 'message');
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
          width: Get.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image(
                  image: Image.network(
                          'https://img.freepik.com/free-vector/flat-sale-banner-with-photo_23-2149026968.jpg')
                      .image,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nguyen van a',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'Fast food delivery',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 24,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    ),
    const Spacer(),
    Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
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
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ];
}
