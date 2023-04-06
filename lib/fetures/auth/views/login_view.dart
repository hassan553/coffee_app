import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/widget/custom_sized_box.dart';
import 'package:coffee_app/core/widget/text_form_field.dart';
import 'package:coffee_app/fetures/auth/views/register_view.dart';
import 'package:coffee_app/fetures/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/functions/get_size.dart';
import '../../../core/functions/navigation.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_text.dart';
import '../../profile/profile_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screenSize(context).width,
        height: screenSize(context).height,
        decoration: BoxDecoration(
          color: AppColors.brownLite.withOpacity(.6),
          image: const DecorationImage(
            image: AssetImage('assets/login.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/coffee.png',
                  width: 200,
                  fit: BoxFit.fill,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 5),
                  child: MaterialButton(
                    padding: const EdgeInsets.all(20),
                    color: AppColors.brownLite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      navigatedTo(const RegisterView());
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
              ],
            ),
            const CustomSizedBox(value: .1),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: 'Sign In',
                      color: AppColors.brown,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    const CustomSizedBox(value: .01),
                    CustomText(
                      title: 'Email address',
                      color: AppColors.brownLite,
                      fontSize: 20,
                    ),
                    const CustomTextField(hintText: 'email'),
                    const CustomSizedBox(value: .05),
                    CustomText(
                      title: 'Password',
                      color: AppColors.brownLite,
                      fontSize: 20,
                    ),
                    const CustomTextField(hintText: 'password'),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: screenSize(context).width * .7,
                child: CustomButton(
                  function: () {
                    navigatedTo(const HomeView());
                  },
                  title: 'Sign In',
                  fontSize: 20,
                ),
              ),
            ),
            const CustomSizedBox(value: .03),
          ],
        ),
      ),
    );
  }
}
