import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/business_logic/cubits/auth_cubit.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';
import 'package:nobitok/presentation/widgets/custom_labeled_text_field.dart';
import 'package:nobitok/presentation/widgets/middle_texted_divider.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';
import '../widgets/custom_image_widget.dart';
import '../widgets/horizontal_padding.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: kLoginScreenBackgroundColor,
        child: HorizontalPadding(
// * white card for login
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 160.h,
              ),
              Container(
                width: 335.w,
                height: 472.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 16.h,
                    bottom: 20.h,
                    right: 16.w,
                    left: 16.w,
                  ),
                  child: Column(
                    children: [
// * first row(pins)
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImage(
                            path: 'assets/icons/grey_pin.png',
                            width: 12,
                            height: 12,
                          ),
                          CustomImage(
                            path: 'assets/images/icon.png',
                            height: 65,
                            width: 67,
                          ),
                          CustomImage(
                            path: 'assets/icons/grey_pin.png',
                            width: 12,
                            height: 12,
                          ),
                        ],
                      ),
// * app name :
                      Text(
                        kAppName,
                        style: kAppTitleTextStyle,
                      ),
                      SizedBox(
                        height: 32.57.h,
                      ),
// * name textField:
                      CustomLabeledTextField(
                        keyboardType: TextInputType.text,
                        controller: usernameController,
                        hintText: 'نام و نام خانوادگی',
                        label: 'نام کاربری را وارد کنید',
                      ),
                      SizedBox(
                        height: 32.57.h,
                      ),
                      CustomLabeledTextField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          hintText: '********',
                          label: 'رمز خود را وارد کنید'),
                      SizedBox(
                        height: 25.h,
                      ),
// * forgot password:
                      const MiddleTextedDivider(
                        text: "رمز خود را فراموش کرده اید؟",
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
// * change password:
                      InkWell(
                        onTap: () {
                          //TODO
                        },
                        child: Text(
                          'تغییر رمز عبور',
                          textAlign: TextAlign.center,
                          style: kMedium12TextStyle.copyWith(
                            color: const Color(0xFF3A4DFF),
                          ),
                        ),
                      ),
                      const Spacer(),
// * login button:
                      CustomButton(
                        height: 44,
                        width: 191,
                        fontSize: 20,
                        onPressed: () {
                          final username = usernameController.text;
                          print(username);
                          final password = passwordController.text;
                          print(password);
                          context.read<AuthCubit>().auth(username, password);
                        },
                        borderRadius: kBorderRadius8,
                        color: kGreenColor,
                        text: 'ورود',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
