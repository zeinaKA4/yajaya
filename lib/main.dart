import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yajaya/config/app_color.dart';
import 'package:yajaya/config/session.dart';
import 'package:yajaya/presentasion/controller/c_user.dart';
import 'package:yajaya/presentasion/page/dashboard_page.dart';
import 'package:yajaya/presentasion/page/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Session.getUser();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cUser = Get.put(CUser());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: AppColor.primary,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.primary,
          ),
          colorScheme: const ColorScheme.dark().copyWith()),
      home: Obx(() {
        if (cUser.data.idUser == null) return const LoginPage();
        return const DashboardPage();
      }),
    );
  }
}
