import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 300.w,
      child: TextField(
        // controller: controller,
        onChanged: (val) {},
        onTap: () {},
        decoration: InputDecoration(
            hintText: 'search',
            hintStyle: TextStyle(color: greyColor, fontSize: 16),
            prefixIcon: Icon(Icons.search),
            // suffixIcon: IconButton(
            //   icon: Icon(Icons.cancel),
            //   onPressed: () {
            //     //mv.clearSearch();
            //   },
            // ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            fillColor: Colors.white,
            filled: true),
      ),
    );
  }
}
