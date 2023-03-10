import 'package:flutter/material.dart';

import '../../../data/controller/load_one_controller.dart';
import '../../../data/model/user_model.dart';
import '../../../helper/load_one_helper.dart';

class ManageOrderScreen extends LoadOneHelper<UserModel> {
  const ManageOrderScreen({Key? key}) : super(key: key);

  @override
  LoadOneController<UserModel> init() {
    return LoadOneController(
        pathCollection: 'user', id: '3e669c10-bb3b-11ed-a436-61d5cb3e0da1');
  }

  @override
  Widget buildUI(UserModel data) {
    return Text(data.phoneNumber.toString());
  }

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }
}
