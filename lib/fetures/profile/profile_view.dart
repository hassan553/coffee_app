import 'package:coffee_app/core/functions/get_size.dart';
import 'package:coffee_app/core/functions/navigation.dart';
import 'package:coffee_app/core/widget/custom_sized_box.dart';
import 'package:coffee_app/core/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: screenSize(context).width,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset('assets/Purple.png'),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset('assets/Blue.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSizedBox(value: .05),
                  InkWell(
                    onTap: () {
                      pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                  ),
                  const CustomSizedBox(value: .03),
                  CustomText(
                    title: 'Profile',
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  const CustomSizedBox(value: .03),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.amber,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            title: 'Hassan Marzouk',
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            title: 'hassan@gmail.com',
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
