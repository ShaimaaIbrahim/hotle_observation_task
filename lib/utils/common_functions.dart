import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'colors.dart';


Widget widthSpace(double widthSpace) {
  return SizedBox(
    width: widthSpace,
  );
}

Widget heightSpace(double heightSpace) {
  return SizedBox(
    height: heightSpace,
  );
}

String formatTimeStamp(Timestamp timestamp) {
  var dt = timestamp.toDate().toUtc();
  return dt.day.toString().trim() +
      "/" +
      dt.month.toString().trim() +
      "/" +
      dt.year.toString().trim();
}
//
// Future<Position> getCurrentLocation() async{
//   return await GeolocatorPlatform.instance.getCurrentPosition();
//
// }

showDialoge(Widget widget, BuildContext context, {Color? color}){
  return showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: widget,
    ),
  );
}

showSnackBar(message, context){
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

generateBarCode(){

}
