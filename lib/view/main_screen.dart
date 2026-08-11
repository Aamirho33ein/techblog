import 'package:flutter/material.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/view/home_screnn.dart';
import 'package:tec/view/my_cats.dart';
import 'package:tec/view/profile_screen.dart';
import 'package:tec/view/register_intro.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

var selectedPageIndex = 0;

class _MainScreenState extends State<MainScreen> {
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
                const Divider(color: SolidColors.dividerColor),
                ListTile(
                  title: Text("درباره تک بلاگ", style: textTheme.bodySmall),
                  onTap: () {},
                ),
                const Divider(color: SolidColors.dividerColor),
                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.bodySmall,
                  ),
                  onTap: () {},
                ),
                const Divider(color: SolidColors.dividerColor),
                ListTile(
                  title: Text("تک بلاگ در گیت هاب", style: textTheme.bodySmall),
                  onTap: () {},
                ),
                const Divider(color: SolidColors.dividerColor),
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
              child: IndexedStack(
                index: selectedPageIndex,
                children: [
                  HomeScreen(
                    size: size,
                    textTheme: textTheme,
                    bodymargin: bodymargin,
                  ),

                  ProfileScreen(
                    size: size,
                    textTheme: textTheme,
                    bodymargin: bodymargin,
                  ),
                  // یادت باشه که الکیه
                  RegisterIntro(),
                ],
              ),
            ),
            BottomNavigation(
              size: size,
              bodymargin: bodymargin,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.bodymargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodymargin;
  final Function(int) changeScreen;

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
                  onPressed: (() => changeScreen(2)),
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
