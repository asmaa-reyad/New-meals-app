import 'package:flutter/material.dart';
import 'package:meals_app/core/utls/asset_maneger.dart';
import 'package:meals_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:meals_app/features/auth/presentation/widgets/custom_txt_form.dart';
import 'package:meals_app/features/select_favourite_meal/presentation/widgets/custom_meal_item.dart';
import 'package:meals_app/media_query_values.dart';

class SelectFavMealBody extends StatefulWidget {
  const SelectFavMealBody({super.key});

  @override
  State<SelectFavMealBody> createState() => __SelectFavMealBodyStateState();
}

class __SelectFavMealBodyStateState extends State<SelectFavMealBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                 const Expanded(
                    child:  Text(
                      "",
                      style: TextStyle(
                          color: Color(0xff7F59D0),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      AssetManeger.logo,
                      height: SizeConfig.size! * 20,
                    ),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please , Select your favourite meals to help us to find your request ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                  height: SizeConfig.size! * 30, child: const MealsGridView()),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Do you have any other favourite varieties ?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const CustomTextField(
                maxLines: 5,
                hintTxt: "Write here",
              ),
              SingleChildScrollView(
                child: CustomBottom(
                  txt: "Continue",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MealsGridView extends StatelessWidget {
  const MealsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(20.0),
          child: CustomMealItem(
            meal: "fish fish",
          ),
        );
      },
    );
  }
}
