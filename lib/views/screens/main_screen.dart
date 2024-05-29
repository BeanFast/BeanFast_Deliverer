import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/contrains/theme_color.dart';
import '/controllers/auth_controller.dart';
import 'delivery_schedules_screen.dart';
import 'qr_scanner_screen.dart';
import 'account_screen.dart';
import '/utils/constants.dart';

class MainScreen extends GetView<AuthController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const DeliveryScheduleScreen(),
      const AccountScreen()
    ];
    List iconList = [Iconsax.calendar_tick, Iconsax.profile_2user];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(() => screens[selectedMenuIndex.value]),
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar.builder(
          height: 50,
          activeIndex: selectedMenuIndex.value,
          onTap: changePage,
          itemCount: iconList.length,
          tabBuilder: (index, isActive) {
            return Icon(
              iconList[index],
              size: 24,
              color: isActive ? ThemeColor.inputColor : Colors.black54,
            );
          },
          notchMargin: 5,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const QRScanScreen());
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        backgroundColor: ThemeColor.inputColor,
        child: const Icon(
          Iconsax.scan_barcode,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
