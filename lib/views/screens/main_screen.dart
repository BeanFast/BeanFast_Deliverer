import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/contrains/theme_color.dart';
import '/views/screens/delivery_schedules_screen.dart';
import '/views/screens/qr_scanner_screen.dart';
import '/utils/constants.dart';
import 'account_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const DeliveryScheduleScreen(),
      const AccountScreen()
    ];

    List iconList = [Iconsax.calendar_tick, Iconsax.profile_2user];

    return Scaffold(
      appBar: AppBar(
        actions: headerActionWidget(),
      ),
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
              color: isActive ? ThemeColor.primaryColor : Colors.black54,
            );
          },
          notchMargin: 5,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
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
              Obx(() => ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: currentUser.value == null
                        ? Image.asset('assets/images/image_not_available.png')
                        : Image.network(
                            currentUser.value!.avatarPath!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                  )),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Text(
                          currentUser.value == null
                              ? 'Chưa có thông tin'
                              : currentUser.value!.fullName!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Get.textTheme.bodyMedium!.copyWith(
                            color: Colors.green,
                          ),
                        )),
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
            ],
          ),
        ),
      ),
    ),
    const Spacer(),
  ];
}
