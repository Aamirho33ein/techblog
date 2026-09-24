import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/component/api_constant.dart';
import 'package:tec/component/storage_const.dart';
import 'package:tec/main.dart';
import 'package:tec/services/dio_services.dart';
import 'package:tec/view/main_screen/main_screen.dart';
import 'package:tec/view/register/register_intro.dart';

class RegisterController extends GetxController {
  TextEditingController emaileditingController = TextEditingController();
  TextEditingController activecodeeditingController = TextEditingController();

  var email = '';
  var userId = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emaileditingController.text,
      'command': 'register',
    };

    var response = await DioServices().postMethod(map, ApiConstant.postRegiset);
    email = emaileditingController.text;
    userId = response.data['user_id'];
    debugPrint(response);
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activecodeeditingController.text,
      'command': 'verify',
    };
    debugPrint(map.toString());
    var response = await DioServices().postMethod(map, ApiConstant.postRegiset);
    debugPrint(response.data.toString());
    var status = response.data['response'];

    switch (status) {
      case 'verified':
        var box = GetStorage();

        box.write(StorageConst.token, response.data['token']);

        box.write(StorageConst.userId, response.data['user_id']);

        // ignore: prefer_interpolation_to_compose_strings
        debugPrint("read ::: " + box.read(StorageConst.token));
        // ignore: prefer_interpolation_to_compose_strings
        debugPrint("read ::: " + box.read(StorageConst.userId));

        Get.offAll(MainScreen());

        break;

      case 'incorrect_code':
        Get.snackbar('خطا', "کد فعالسازی اشتباه است");
        break;

      case 'expired':
        Get.snackbar('خطا', "کد فعالسازی منقضی شده است");
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(StorageConst.token) == null) {
      Get.to(RegisterIntro());
    } else {
      routToWriteBottomSheet();
    }
  }

  routToWriteBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height / 3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset("assets/images/techbot.svg", height: 40),
                  SizedBox(width: 10),
                  const Text(
                    "دونسته هات رو با بقیه به اشتراک بذار ...",
                    style: TextStyle(
                      fontFamily: 'vanil',
                      fontSize: 15,
                      color: Color.fromARGB(255, 70, 70, 70),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                """
فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی
دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار..
""",
                style: TextStyle(
                  fontFamily: 'vanil',
                  fontSize: 14,
                  color: Color.fromARGB(255, 107, 107, 107),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(NamedRout.manageArticle);
                    },
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/sendArticle.png",
                            height: 32,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "مدیریت مقاله ها",
                            style: TextStyle(
                              fontFamily: 'vanil',
                              fontSize: 15,
                              color: Color.fromARGB(255, 70, 70, 70),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint("write podcast");
                    },
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/sendPodcast.png",
                            height: 32,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "مدیریت پادکست ها",
                            style: TextStyle(
                              fontFamily: 'vanil',
                              fontSize: 15,
                              color: Color.fromARGB(255, 70, 70, 70),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
