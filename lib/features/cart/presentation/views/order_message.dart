import '../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/widget/custom_text.dart';
import '../../../home/presentation/views/main_view.dart';


class OrderMessage extends StatefulWidget {
  const OrderMessage({super.key});

  @override
  State<OrderMessage> createState() => _OrderMessageState();
}

class _OrderMessageState extends State<OrderMessage> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _orderNavigateFunction();
  }

  void _orderNavigateFunction() {
    Future.delayed(const Duration(seconds: 3),
        () => navigatedTo(const MainView()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/coffee_loading.json'),
            CustomText(
            title: 'You Well Receive Your\nOrder After 1 Minute ',
            color: AppColors.orange,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          ],
        )
      ),
    );
  }
}