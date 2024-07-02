import 'package:ecoludeco/Theme/main_page_widget.dart';
import 'package:ecoludeco/Theme/theme_colors.dart';
import 'package:ecoludeco/auth/auth_widget.dart';
import 'package:ecoludeco/candle_details/candle_details_widget.dart';
import 'package:ecoludeco/my_app_widget.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecoludeco shop',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: ThemeColors.light.pinkColor),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ThemeColors.light.pinkColor,
          selectedItemColor: Color(0xff94fffa),
          unselectedItemColor: Color(0xffe6e6e6),
        ),
      ),
      routes: {
        '/': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainPageWidget(),
        '/main_screen/candle_details': (context) => const CandleDetailsWidget(),
      },
      initialRoute: '/main_screen',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text(
                'Oops, error happened 😑',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
          );
        });
      },
    );
  }
}
