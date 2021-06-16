import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funny_number/utilities/constants.dart';
import 'package:funny_number/views/home_page.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(FunnyNumberApp());
}

class FunnyNumberApp extends StatelessWidget {
  const FunnyNumberApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: kAppTitle,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        fontFamily: "Barlow",
        primaryColor: kPrimaryColor,
        primaryColorDark: kPrimaryDarkColor,
      ),
      home: HomePage(),
    );
  }
}
