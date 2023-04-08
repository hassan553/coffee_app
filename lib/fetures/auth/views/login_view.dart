import '../../../core/utils/app_colors.dart';
import '../../../core/widget/text_form_field.dart';
import '../widgets/auth_background_image.dart';
import 'register_view.dart';
import '../../home/views/home_view.dart';
import 'package:flutter/material.dart';
import '../../../core/functions/navigation.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_image.dart';
import '../../../core/widget/custom_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLoginBody(context),
    );
  }

  AuthBackgroundImage _buildLoginBody(BuildContext context) {
    return AuthBackgroundImage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topLeftImage(),
              const Spacer(),
              _buildSignUpButton(),
            ],
          ),
          const SizedBox(height: 60),
          _buildInnerInfoWidgets(),
          const Spacer(),
          _buildSignInButton(context),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  SingleChildScrollView _buildInnerInfoWidgets() {
    return SingleChildScrollView(
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
            const SizedBox(height: 5),
            CustomText(
              title: 'Email address',
              color: AppColors.brownLite,
              fontSize: 20,
            ),
            const CustomTextField(hintText: 'email'),
            const SizedBox(height: 20),
            CustomText(
              title: 'Password',
              color: AppColors.brownLite,
              fontSize: 20,
            ),
            const CustomTextField(hintText: 'password'),
          ],
        ),
      ),
    );
  }

  Align _buildSignInButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .7,
        child: CustomButton(
          function: () {
            navigatedTo(const HomeView());
          },
          title: 'Sign In',
          fontSize: 20,
        ),
      ),
    );
  }

  Padding _buildSignUpButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 5),
      child: MaterialButton(
        padding: const EdgeInsets.all(20),
        color: AppColors.brownLite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          navigatedTo(const RegisterView());
        },
        child: const Text('Sign Up'),
      ),
    );
  }

  CustomAssetsImage _topLeftImage() {
    return CustomAssetsImage(
        path: 'assets/coffee.png', width: 200, boxFit: BoxFit.fill);
  }
}
