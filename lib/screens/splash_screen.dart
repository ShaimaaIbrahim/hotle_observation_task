import 'package:flutter/material.dart';
import 'package:hotel_observation_assignment/db/database_helper.dart';
import 'package:hotel_observation_assignment/utils/colors.dart';
import 'package:hotel_observation_assignment/utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../locator.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int length = 0;

  @override
  void initState() {
    DbHelper().init().then((value) {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(375, 811),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: bold28Text(length.toString(), color: primaryColor),
          ),
        ),
      ),
    );
  }
}

