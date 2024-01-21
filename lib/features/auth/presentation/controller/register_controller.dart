import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coffee_app/core/functions/navigation.dart';
import 'package:coffee_app/core/widget/show_awesomeDialog.dart';
import '../../../home/presentation/views/main_view.dart';
import '../../data/repository/auth_repo.dart';

class RegisterController extends GetxController {
  AuthRepo authRepo;
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  RegisterController({
    required this.authRepo,
  });
  bool isLoading = false;
  void userRegister({
    required BuildContext context,
  }) async {
    isLoading = true;
    update();

    final result = await authRepo.userRegister(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
    result.fold((l) {
      showAwesomeDialogs(
          context: context, title: "Warning", description: l.message);
    }, (r) {
      navigatedOffAll(const MainView());
    });
    isLoading = false;
    update();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
