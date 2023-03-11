import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../data/controller/auth_controller.dart';
import '../../../design/extension/double_extension.dart';
import '../../../share/constant/constant.dart';
import '../../auth/sign_up/signup_background.dart';

class SetupStoreScreen extends StatelessWidget {
  SetupStoreScreen({Key? key}) : super(key: key);

  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SignUpBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SETUP YOUR STORE FIRST',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 0.05.w,
                    color: Colors.black)),
            SvgPicture.asset("assets/icons/signup.svg", width: 0.8.w),
            SizedBox(height: 0.01.h),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                width: 0.8.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                  color: kPrimaryLightColor,
                ),
                child: TextField(
                  controller: controller.storeName,
                  decoration: InputDecoration(
                      hintText: "Name of your store",
                      icon: Icon(Icons.person, color: kPrimaryColor),
                      border: InputBorder.none),
                )),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                width: 0.8.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                  color: kPrimaryLightColor,
                ),
                child: TextField(
                  controller: controller.storeAddress,
                  decoration: InputDecoration(
                      hintText: "Address of your store",
                      icon: Icon(Icons.mail, color: kPrimaryColor),
                      border: InputBorder.none),
                )),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                width: 0.8.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                  color: kPrimaryLightColor,
                ),
                child: TextField(
                  controller: controller.storeAvatar,
                  decoration: InputDecoration(
                      hintText: "Avatar of your store",
                      icon: Icon(Icons.person_2_outlined, color: kPrimaryColor),
                      border: InputBorder.none),
                )),
            SizedBox(height: 0.04.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: MaterialButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                minWidth: 0.8.w,
                color: kPrimaryColor,
                onPressed: () {
                  controller.onSetupStore(context);
                },
                child: const Text(
                  "Continuous",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 0.01.h),
          ],
        ),
      ),
    ));
  }
}
