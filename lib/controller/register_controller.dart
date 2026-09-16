import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tec/component/api_constant.dart';
import 'package:tec/services/dio_services.dart';

class RegisterController extends GetxController {
  TextEditingController emaileditingController = TextEditingController();
  TextEditingController activecodeeditingController = TextEditingController();

  register() async {
    Map<String, dynamic> map = {
      'email': emaileditingController.text,
      'command': 'register',
    };

    var response = await DioServices().postMethod(map, ApiConstant.postRegiset);
    print(response);
  }
}
