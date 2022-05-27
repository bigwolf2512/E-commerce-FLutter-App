import 'dart:async';

import 'package:ecommerceshop/app_const/app_const.dart';
import 'package:ecommerceshop/data/controller/auth_controller.dart';
import 'package:ecommerceshop/data/controller/cart_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';
import '../../route_helper/route_helper.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isLogout = false;
    logoutButton() {
      if (Get.find<AuthController>().TOKEN.isNotEmpty) {
        Get.find<AuthController>().remove();
        Timer(Duration(seconds: 1), () {
          RouteHelper.getSignIn(context);
        });
      } else {
        RouteHelper.getSignIn(context);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                pinned: true,
                expandedHeight: size.height * 0.4,
                collapsedHeight: size.height * 0.1,
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(userAvatar),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                    title: Text(
                      Get.find<AuthController>().TOKEN.isNotEmpty
                          ? authController.userData.name!
                          : 'Your Profile',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0))),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.all(size.width * 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'User Name',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(29),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  alignment: Alignment.centerLeft,
                                  height: size.height * 0.08,
                                  width: size.width * 0.9,
                                  color: Color.fromRGBO(158, 158, 158, 1)
                                      .withOpacity(0.3),
                                  child: Text(
                                    authController.userData.name!,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Email Address',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(29),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  alignment: Alignment.centerLeft,
                                  height: size.height * 0.08,
                                  width: size.width * 0.9,
                                  color: Colors.grey.withOpacity(0.3),
                                  child: Text(
                                    authController.userData.email!,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Phone Number',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(29),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  alignment: Alignment.centerLeft,
                                  height: size.height * 0.08,
                                  width: size.width * 0.9,
                                  color: Colors.grey.withOpacity(0.3),
                                  child: Text(
                                    authController.userData.phoneNumber!,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Created At',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(height: size.height * 0.02),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(29),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  alignment: Alignment.centerLeft,
                                  height: size.height * 0.08,
                                  width: size.width * 0.9,
                                  color: Colors.grey.withOpacity(0.3),
                                  child: Text(
                                    authController.userData.createdAt!,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.07),
                              InkWell(
                                onTap: logoutButton,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(29),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    alignment: Alignment.centerLeft,
                                    height: size.height * 0.08,
                                    width: size.width * 0.9,
                                    color: Colors.deepOrange,
                                    child: Center(
                                      child: Text(
                                        Get.find<AuthController>().TOKEN.isEmpty
                                            ? 'LETS SIGN IN'
                                            : 'LOG OUT',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
