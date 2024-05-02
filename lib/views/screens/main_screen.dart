import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:beanfast_deliverer/views/widgets/image_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '/utils/constants.dart';
import '/views/screens/delivery_schedules_screen.dart';
import '/views/screens/qr_scanner_screen.dart';
import 'account_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const DeliveryScheduleScreen(),
      const AccountScreen()
    ];
<<<<<<< HEAD

    List iconList = [Iconsax.calendar_tick, Iconsax.profile_2user];

=======
    List iconList = [Iconsax.calendar_tick, Iconsax.profile_2user];
>>>>>>> 6d76fe10aa8e9ac6eb36e53afcf7e390d85a1fed
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
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
          width: Get.width * 0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
<<<<<<< HEAD
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
=======
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CustomNetworkImage(
                  currentUser.value.avatarPath.toString(),
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
>>>>>>> 6d76fe10aa8e9ac6eb36e53afcf7e390d85a1fed
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
<<<<<<< HEAD
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
=======
                    Text(
                      currentUser.value.fullName! ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Get.textTheme.bodyLarge!.copyWith(
                        color: Colors.green,
                      ),
                    ),
>>>>>>> 6d76fe10aa8e9ac6eb36e53afcf7e390d85a1fed
                    Text(
                      'BeanFast giao hàng viên',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: Colors.black54,
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
