import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/view/main_screen.dart';
import 'package:tec/view/my_cats.dart';
import 'package:tec/view/register_intro.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNvigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('fa')], // farsi
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            width: 2,
          )
          ),

        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          
          
          style: ButtonStyle(
            
                    // ignore: non_constant_identifier_names
                    textStyle: WidgetStateProperty.resolveWith((States) {
                      if (States.contains(WidgetState.pressed)) {
                        return TextStyle(            fontFamily: 'vanil',
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 255, 255, 255));
                      }
                      return TextStyle(            fontFamily: 'vanil',
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Color.fromARGB(200, 255, 255, 255));
                    }),

                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Color.fromARGB(255, 40, 107, 184);
                      }
                      return Color.fromARGB(255, 68, 4, 87);
                    }),
                  ),
        ),



        fontFamily: 'vanil',

        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'vanil',
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: SolidColors.posterTitle,
          ),
          titleLarge: TextStyle(
            fontFamily: 'vanil',
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: SolidColors.posterSubTitle,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'vanil',
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'vanil',
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'vanil',
            fontSize: 15,
            color: SolidColors.seeMore,
            fontWeight: FontWeight.w700,
          ),
          bodySmall: TextStyle(
            fontFamily: 'vanil',
            fontSize: 15,
            color: Color.fromARGB(255, 70, 70, 70),
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            fontFamily: "vanil",
            fontSize: 15,
            color: Color.fromARGB(255, 154, 154, 154),
            fontWeight: FontWeight.w700,
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: MyCats(),
    );
  }
}
