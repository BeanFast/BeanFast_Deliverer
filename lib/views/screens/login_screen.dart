import 'package:animate_do/animate_do.dart';
import 'package:beanfast_deliverer/views/widgets/sbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '/controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    final formKey = controller.formKey;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Đăng Nhập',
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: formKey,
          child: Container(
            color: Colors.black.withOpacity(0.1),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.2,
                  child: Lottie.asset(
                    "assets/login.json",
                    animate: true,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      FadeInUp(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email',
                            style: Get.textTheme.titleMedium!.copyWith(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      FadeInUp(
                        child: SizedBox(
                          width: double.infinity, // Set the width
                          height: 85,
                          child: TextFormField(
                            controller: controller.emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  gapPadding: 0),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Vui lòng nhập email';
                              } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                                return 'Vui lòng nhập email hợp lệ';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      FadeInUp(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Mật khẩu',
                            style: Get.textTheme.titleMedium!.copyWith(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      FadeInUp(
                        child: Obx(
                          () => SizedBox(
                            width: double.infinity, 
                            height: 85,
                            child: TextFormField(
                              controller: controller.passwordController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock_outlined),
                                hintText: 'Mật khẩu',
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isPasswordVisible.value
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                  ),
                                  onPressed: () {
                                    controller.togglePasswordVisibility();
                                  },
                                ),
                              ),
                              obscureText: controller.isPasswordVisible.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập mật khẩu';
                                }
                                if (value.length < 8) {
                                  return 'Mật khẩu phải có ít nhất 8 ký tự';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),

                      Obx(
                        () => Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            controller.errorMessage.value,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      // const SizedBox(height: 10),
                      // FadeInUp(
                      //   child: Row(
                      //     children: [
                      //       Obx(
                      //         () => SizedBox(
                      //           height: 24,
                      //           width: 24,
                      //           child: Checkbox(
                      //             value: controller.isChecked.value,
                      //             onChanged: (value) {
                      //               controller.toggleIschecked();
                      //             },
                      //           ),
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         width: 10,
                      //       ),
                      //       const Text('Lưu mật khẩu'),
                      //       const Spacer(),
                      //       TextButton(
                      //         onPressed: () {
                      //           // Your onPressed code for "Forgot Password" here
                      //         },
                      //         child: const Text('Quên mật khẩu?'),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      FadeInUp(
                        child: SButton(
                          color: Colors.green,
                          borderColor: Colors.green,
                          text: 'Đăng nhập',
                          textStyle: Get.textTheme.titleSmall!.copyWith(
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.login();
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
