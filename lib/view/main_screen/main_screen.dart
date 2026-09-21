import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tec/component/api_constant.dart';
import 'package:tec/component/my_colors.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/controller/register_controller.dart';
import 'package:tec/services/dio_services.dart';
import 'package:tec/view/main_screen/home_screnn.dart';
import 'package:tec/view/main_screen/profile_screen.dart';
import 'package:tec/view/my_cats.dart';
import 'package:tec/view/register/register_intro.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

RxInt selectedPageIndex = 0.obs;

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodymargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scofoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodymargin, left: bodymargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset("assets/images/Logo.png", scale: 3),
                  ),
                ),
                ListTile(
                  title: Text("پروفایل کاربری", style: textTheme.bodySmall),
                  onTap: () {},
                ),
                const Divider(color: Color.fromARGB(255, 188, 188, 188)),
                ListTile(
                  title: Text("درباره تک بلاگ", style: textTheme.bodySmall),
                  onTap: () {},
                ),
                const Divider(color: Color.fromARGB(255, 188, 188, 188)),
                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.bodySmall,
                  ),
                  onTap: () async {
                    SharePlus.instance.share(
                      ShareParams(
                        text: 'من تک بلاگ رو نصب کردم ، خیلی خفنه تو هم نصب کن',
                      ),
                    );
                  },
                ),
                const Divider(color: Color.fromARGB(255, 188, 188, 188)),
                ListTile(
                  title: Text("تک بلاگ در گیت هاب", style: textTheme.bodySmall),
                  onTap: () {},
                ),
                const Divider(color: Color.fromARGB(255, 188, 188, 188)),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: SolidColors.scofoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: Icon(Icons.menu, color: Colors.black),
              ),
              Image.asset("assets/images/Logo.png", height: size.height / 16),
              Icon(Icons.search, color: Colors.black),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Obx(
                () => IndexedStack(
                  index: selectedPageIndex.value,
                  children: [
                    HomeScreen(
                      size: size,
                      textTheme: textTheme,
                      bodymargin: bodymargin,
                    ),

                    ProfileScreen(),
                    // یادت باشه که الکیه
                    RegisterIntro(),
                  ],
                ),
              ),
            ),
            BottomNavigation(
              size: size,
              bodymargin: bodymargin,
              changeScreen: (int value) {
                selectedPageIndex.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
   BottomNavigation({
    super.key,
    required this.size,
    required this.bodymargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodymargin;
  final Function(int) changeScreen;
  RegisterController _registerController = Get.put(
    RegisterController(),
    permanent: false,
  );
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 0,
      left: 0,

      child: Container(
        height: size.height / 12,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradiantColors.bottunNavBacgroand,
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: bodymargin, right: bodymargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: GradiantColors.bottomNav),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: (() => changeScreen(0)),
                  icon: ImageIcon(
                    AssetImage("assets/icons/home.png"),
                    color: Colors.white,
                  ),
                ),

                IconButton(
                  onPressed: () {
                    _registerController.toggleLogin();
                  },
                  icon: ImageIcon(
                    AssetImage("assets/icons/par.png"),
                    color: Colors.white,
                  ),
                ),

                IconButton(
                  onPressed: (() => changeScreen(1)),
                  icon: ImageIcon(
                    AssetImage("assets/icons/user.png"),
                    color: Colors.white,
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
