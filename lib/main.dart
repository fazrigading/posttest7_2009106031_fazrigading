import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'homepage.dart';
import 'splashscreen.dart';
import 'profilepage.dart';
import 'landingpage.dart';
import 'errorpage.dart';
import 'userlogmenu.dart';
import 'adminpage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NFT Marketplace App',
      theme: ThemeData(
          fontFamily: 'Manrope',
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
      debugShowCheckedModeBanner: false,
      unknownRoute:
          GetPage(name: '/notfound', page: () => const UnknownRoutePage()),
      initialBinding: BindingsBuilder(() => {Get.put(UserController())}),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/landingpage', page: () => const LandingPage()),
        GetPage(name: '/homepage', page: () => const HomePage()),
        GetPage(name: '/profilepage', page: () => const ViewProfile()),
        GetPage(name: '/loginpage', page: () => const LoginPage()),
        GetPage(name: '/registpage', page: () => const RegistPage()),
        GetPage(name: '/adminpage', page: () => const AdminPage()),
      ],
    );
  }
}
