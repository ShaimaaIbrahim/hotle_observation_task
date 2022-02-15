import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_observation_assignment/utils/extensions.dart';
import '../../locator.dart';
import '../../routes/RoutesNames.dart';
import '../../services/navigation_services.dart';
import '../../utils/colors.dart';
import '../../utils/common_functions.dart';
import '../../utils/texts.dart';
import '../../widgets/styled_button.dart';
import '../../widgets/styled_text_field.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: SingleChildScrollView(
                 child: Padding(
                   padding: EdgeInsets.all(23.w),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         children: [
                           Image.asset(
                             'assets/images/logo.png',
                             width: 134.w,
                             height: 93.h,
                             color: primaryColor,
                           ),
                           Spacer(),
                           Image.asset(
                             'assets/icons/close.png',
                             width: 16.w,
                             height: 16.h,
                             color: primaryColor,
                           )
                         ],
                       ),
                       heightSpace(45.h),
                       bold22Text('عمل حساب جديد'),
                       heightSpace(22.h),
                       bold12Text('الأسم الأول'),
                       heightSpace(5.h),
                       StyledTextField(
                         hint: 'الأسم الأول',
                       ),
                       heightSpace(22.h),
                       bold12Text('الأسم الاخير'),
                       heightSpace(5.h),
                       StyledTextField(
                         hint: 'الأسم الاخير',
                       ),
                       heightSpace(22.h),
                       bold12Text('الايميل'),
                       heightSpace(5.h),
                       StyledTextField(
                         hint: 'الايميل',
                       ),
                       heightSpace(22.h),
                       bold12Text('كلمة السر'),
                       heightSpace(5.h),
                       StyledTextField(
                         hint: 'كلمة السر',
                       ),
                       heightSpace(50.h),
                       StyledButton(
                           text: 'إشترك الان',
                           function: () {
                             locator<NavigationService>()
                                 .navigateTo(RouteName.MAIN);
                           }),
                       heightSpace(7.h),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           bold12Text('انا أصلاً عندي حساب !'),
                           widthSpace(8.w),
                           bold12Text('تسجيل دخول', color: additionColor).onTap((){
                             locator<NavigationService>()
                                 .navigateTo(RouteName.AUTH);
                           }),
                         ],
                       )
                     ],
                   ),
                 ),
         ),
       ),
    );
  }
}
