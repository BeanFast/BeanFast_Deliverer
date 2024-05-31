import '/contrains/theme_color.dart';
import '/views/widgets/sbutton.dart';
import '/controllers/auth_controller.dart';
import '/utils/constants.dart';
import '/views/widgets/account_icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class AccountScreen extends GetView<AuthController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    if (controller == null) {
      Get.lazyPut(() => AuthController());
    }
    double width = MediaQuery.of(context).size.width;
    double topCardheight = 160;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ThemeColor.itemColor,
          ),
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: ThemeColor.bgColor,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: topCardheight + 60,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double innerWidth = constraints.maxWidth;
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Card(
                                  color: ThemeColor.itemColor,
                                  child: SizedBox(
                                    height: topCardheight,
                                    width: innerWidth,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            currentUser.value == null
                                                ? 'Chưa có thông tin'
                                                : currentUser.value!.email!,
                                            style: Get.textTheme.bodyMedium!
                                                .copyWith(
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        SizedBox(
                                          width: innerWidth,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                width: innerWidth / 2 - 5,
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.green),
                                                      foregroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.white),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10), // Adjust the value as needed
                                                        ),
                                                      ))),
                                                  child: const Text(
                                                      'Trang cá nhân'),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 40,
                                                width: innerWidth / 2 - 5,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Get.snackbar('Hệ thống',
                                                        'Đang phát triển');
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.green),
                                                      foregroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                                  Colors.white),
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10), // Adjust the value as needed
                                                        ),
                                                      ))),
                                                  child: const Text(
                                                      'Giới thiệu app'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: ClipOval(
                                    child: currentUser.value == null
                                        ? Image.asset(
                                            'assets/images/image_not_available.png')
                                        : Image.network(
                                            currentUser.value!.avatarPath!,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Cài đặt",
                      style: Get.textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    Card(
                      color: ThemeColor.itemColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SettingItem(
                            title: "Dịch vụ & Hợp đồng",
                            icon: Ionicons.earth,
                            iconColor: Colors.black,
                            onTap: () {
                              Get.snackbar('Hệ thống', 'Đang phát triển');
                            },
                          ),
                          SettingItem(
                            title: "Trung tâm Trợ giúp",
                            icon: Ionicons.earth,
                            iconColor: Colors.black,
                            onTap: () {
                              Get.snackbar('Hệ thống', 'Đang phát triển');
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Tiện ích",
                      style: Get.textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    Card(
                      color: ThemeColor.itemColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SettingItem(
                            title: "Ngôn ngữ",
                            icon: Ionicons.earth,
                            iconColor: Colors.black,
                            value: "Tiếng việt",
                            onTap: () {
                              Get.snackbar('Hệ thống', 'Tiếng việt');
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: SButton(
                          color: Colors.green,
                          borderColor: Colors.green,
                          text: "Đăng xuất",
                          textStyle: Get.textTheme.titleSmall!.copyWith(
                            color: Colors.white,
                          ),
                          onPressed: () {
                            controller.logOut();
                          }),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Phiên bản 1.0.0",
                        style: Get.textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '© ${DateTime.now().year} Beanfast',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
