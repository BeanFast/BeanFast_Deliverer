import 'dart:math';

import 'package:beanfast_deliverer/contrains/theme_color.dart';

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
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          currentUser.value.fullName!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              currentUser.value.phone!,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Icon(
                                              Icons.verified_outlined,
                                              color: Colors.green,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        const SizedBox(height: 10),
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
                                    child: Image.network(
                                      currentUser.value.avatarPath!,
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
                    const Text(
                      "Cài đặt",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Card(
                    color: ThemeColor.itemColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SettingItem(
                            title: "Nút số 1",
                            icon: Ionicons.earth,
                            iconColor: Colors.green,
                            onTap: () {},
                          ),
                          SettingItem(
                            title: "Nút số 2",
                            icon: Ionicons.earth,
                            iconColor: Colors.amber,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Tiện ích",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
                            iconColor: Colors.red,
                            value: "Tiếng việt",
                            onTap: () {
                             
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          width: width  - 25,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.logOut();
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        10), // Adjust the value as needed
                                  ),
                                ))),
                            child: const Text('Đăng xuất'),
                          ),
                        ),
                       
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Phiên bản 1.0.0",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
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