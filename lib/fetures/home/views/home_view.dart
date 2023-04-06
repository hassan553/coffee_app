import 'package:coffee_app/core/functions/get_size.dart';
import 'package:coffee_app/core/utils/app_colors.dart';
import 'package:coffee_app/core/widget/custom_sized_box.dart';
import 'package:coffee_app/core/widget/custom_text.dart';
import 'package:flutter/material.dart';


import '../data/repository/home_repo.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeRepository().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: InkWell(
          child: Image.asset('assets/menu.png'),
        ),
        actions: const [
          InkWell(
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 25,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: 'Find the best\nCoffee for you',
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            const CustomSizedBox(value: .02),
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.gray,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 35,
                      color: AppColors.whiteGray,
                    ),
                  ),
                  const SizedBox(width: 20),
                  CustomText(
                    title: 'Find your coffee',
                    color: AppColors.whiteGray,
                    fontSize: 18,
                  ),
                ],
              ),
            ),
            const CustomSizedBox(value: .02),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        counter = index;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText(
                          title: 'Cappuccino',
                          color: counter == index
                              ? AppColors.orange
                              : AppColors.whiteGray,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        Visibility(
                          visible: counter == index,
                          child: const CircleAvatar(
                            radius: 5,
                            backgroundColor: AppColors.orange,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 12,
              ),
            ),
            const CustomSizedBox(value: .02),
            SizedBox(
              height: screenSize(context).height * .25,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                itemBuilder: (context, index) => Container(
                  width: 150,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.whiteGray,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [Image.asset('assets/coffee_image.png')],
                  ),
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
