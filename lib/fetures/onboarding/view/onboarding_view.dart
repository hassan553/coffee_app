import '../../../core/functions/get_size.dart';
import '../../../core/functions/navigation.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_sized_box.dart';
import '../../../core/widget/custom_text.dart';
import 'package:flutter/material.dart';

import '../../auth/views/login_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screenSize(context).width,
        height: screenSize(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/onboarding.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSizedBox(value: .05),
              CustomText(
                title: 'Coffee\nOn The GO!',
                color: AppColors.brown,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
              FittedBox(
                child: CustomText(
                  title: 'Your wait to long ques is over',
                  color: AppColors.brownWhite,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 120,
                  child: CustomButton(
                    function: () {
                      navigatedTo(const LoginView());
                    },
                    title: 'Continue',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
