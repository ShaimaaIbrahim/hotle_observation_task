import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_observation_assignment/screens/BaseScreen.dart';
import 'package:hotel_observation_assignment/screens/auth/viewmodel/auth_viewmodel.dart';
import 'package:hotel_observation_assignment/utils/extensions.dart';
import '../../db/database_helper.dart';
import '../../locator.dart';
import '../../routes/RoutesNames.dart';
import '../../services/navigation_services.dart';
import '../../utils/colors.dart';
import '../../utils/common_functions.dart';
import '../../utils/texts.dart';
import '../../widgets/styled_button.dart';
import '../../widgets/styled_text_field.dart';


TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passController = TextEditingController();

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<AuthViewModel>(
      onModelReady: (_) {

      },
      builder: (_, vm, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(23.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/icons/book.png',
                        width: 134.w,
                        height: 93.h,
                      ),
                    ),
                    heightSpace(45.h),
                    bold22Text('Create new Account'),
                    heightSpace(22.h),
                    bold16Text('Name'),
                    heightSpace(5.h),
                    StyledTextField(
                      hint: 'Name',
                    ),
                    heightSpace(22.h),
                    bold16Text('Email'),
                    heightSpace(5.h),
                    StyledTextField(
                      hint: 'Email',
                    ),
                    heightSpace(22.h),
                    bold16Text('Password'),
                    heightSpace(5.h),
                    StyledTextField(
                      hint: 'Password',
                    ),
                    heightSpace(50.h),
                    StyledButton(
                        text: 'Sign Up',
                        function: () {
                          vm.signUp(vm.getAllUsrers()+1, _nameController.text, _emailController.text, _passController.text, 0)
                              .then((value) {
                            locator<NavigationService>()
                                .navigateTo(RouteName.MAIN);
                          });
                        }),
                    heightSpace(7.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        bold16Text('I already have account'),
                        widthSpace(8.w),
                        bold16Text('SignIn', color: additionColor).onTap(() {}),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
