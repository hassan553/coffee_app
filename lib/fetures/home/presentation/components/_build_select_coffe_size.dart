import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widget/custom_text.dart';

class SelectCoffeeSize extends StatefulWidget {
  const SelectCoffeeSize({super.key});

  @override
  State<SelectCoffeeSize> createState() => _SelectCoffeeSizeState();
}

class _SelectCoffeeSizeState extends State<SelectCoffeeSize> {
  int counter = 0;
  List coffeeSize = ['S', 'M', 'L'];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
            fontSize: 25,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int j = 0; j < 3; j++) ...[
              InkWell(
                onTap: () {
                  setState(() {
                    counter = j;
                  });
                },
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: counter == j ? Colors.orange : Colors.red,
                    ),
                  ),
                  child: CustomText(
                    title: coffeeSize[j],
                    color: counter == j ? Colors.orange : Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }
}
