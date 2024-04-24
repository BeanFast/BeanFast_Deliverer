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

    List iconList = [
      Iconsax.calendar_tick,
      Iconsax.profile_2user
    ];
    
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
              color: isActive ? Colors.green : Colors.black54,
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
        backgroundColor: Colors.green,
        child: const Icon(
          Iconsax.scan_barcode,
          color: Colors.white,
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
       
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
          width: Get.width * 0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image(
                  image: Image.network(
                      // 'https://img.freepik.com/free-vector/flat-sale-banner-with-photo_23-2149026968.jpg'
                      currentUser.value.avatarPath.toString()).image,
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
                      currentUser.value.fullName!,
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
            ],
          ),
        ),
      ),
    ),
    const Spacer(),
  ];
}
