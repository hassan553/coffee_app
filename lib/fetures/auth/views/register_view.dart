import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/widget/custom_sized_box.dart';
import 'package:coffee_app/core/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../core/functions/get_size.dart';
import '../../../core/functions/navigation.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/coffee.png',
                width: 200,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CustomSizedBox(value: .05),
                      CustomText(
                        title: 'Sign Up',
                        color: AppColors.brown,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      const CustomSizedBox(value: .01),
                      CustomText(
                        title: 'Name',
                        color: AppColors.brownLite,
                        fontSize: 20,
                      ),
                      const CustomTextField(hintText: 'name'),
                      const CustomSizedBox(value: .03),
                      CustomText(
                        title: 'Email address',
                        color: AppColors.brownLite,
                        fontSize: 20,
                      ),
                      const CustomTextField(hintText: 'email'),
                      const CustomSizedBox(value: .03),
                      CustomText(
                        title: 'Password',
                        color: AppColors.brownLite,
                        fontSize: 20,
                      ),
                      const CustomTextField(hintText: 'password'),
                      const CustomSizedBox(value: .1),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: screenSize(context).width * .7,
                          child: CustomButton(
                            function: () {
                              navigatedTo(const RegisterView());
                            },
                            title: 'Sign Up',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
