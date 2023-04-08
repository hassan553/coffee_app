import 'package:coffee_app/fetures/home/views/home_view.dart';
import 'package:flutter/material.dart';
import '../../../core/functions/get_size.dart';
import '../../../core/functions/navigation.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_sized_box.dart';
import '../../../core/widget/custom_text.dart';
import '../../../core/widget/text_form_field.dart';
import '../widgets/auth_background_image.dart';
import '../widgets/top_left_image.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _registerBody(context),
    );
  }

  AuthBackgroundImage _registerBody(BuildContext context) {
    return AuthBackgroundImage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopLeftImage(),
          _buildInnerInfoWidgets(context),
        ],
      ),
    );
  }

  Expanded _buildInnerInfoWidgets(BuildContext context) {
    return Expanded(
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
              _buildSignUpButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Align _buildSignUpButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: screenSize(context).width * .7,
        child: CustomButton(
          function: () {
            navigatedTo(const HomeView());
          },
          title: 'Sign Up',
          fontSize: 20,
        ),
      ),
    );
  }
}
