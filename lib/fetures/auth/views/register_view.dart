import 'package:coffee_app/fetures/auth/data/repository/auth_repo.dart';
import 'package:coffee_app/fetures/home/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/functions/get_size.dart';
import '../../../core/functions/navigation.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widget/custom_button.dart';
import '../../../core/widget/custom_sized_box.dart';
import '../../../core/widget/custom_text.dart';
import '../../../core/widget/text_form_field.dart';
import '../../home/presentation/views/home_view.dart';
import '../auth_view_model/register/register_cubit.dart';
import '../widgets/auth_background_image.dart';
import '../widgets/top_left_image.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => RegisterCubit(AuthRepo()),
          child: _registerBody(context)),
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
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccessfullyState) {
              navigatedTo(const MainView());
            } else if (state is RegisterErrorState) {
              print('ererr');
            }
          },
          builder: (context, state) => CustomButton(
            function: () {
              RegisterCubit.get(context).userRegister(
                  email: 'omer2@gmail.com',
                  name: 'omwew',
                  password: '123456',
                  phone: '121111122212');
            },
            title: 'Sign Up',
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
