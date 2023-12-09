import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart' as transition;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:meals_app/core/utls/asset_maneger.dart';
import 'package:meals_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:meals_app/features/auth/presentation/widgets/custom_txt_form.dart';
import 'package:meals_app/features/select_favourite_meal/presentation/pages/select_fav_meal.dart';
import 'package:meals_app/media_query_values.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  bool isObsecured = true;
  IconData? obscuredSuffixIcon = FontAwesomeIcons.eye;
  IconData? notObscuredSuffixIcon = FontAwesomeIcons.eyeLowVision;
  bool? rememberMe = false;
  String? email = "", password = "";
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: AbsorbPointer(
              absorbing: isLoading,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Opacity(
                        opacity: .7,
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
                            const Text(
                              "LOGIN NOW",
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomTextField(
                      prefixIcon: Icons.email,
                      hintTxt: "Email",
                      autoValidateMode: autoValidateMode,
                      inputType: TextInputType.emailAddress,
                      onChanged: (p0) {
                        email = p0;
                      },
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Feild is required";
                        }
                        if (!p0.isEmail) {
                          return "Enter a valid Email";
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      prefixIcon: (FontAwesomeIcons.lock),
                      hintTxt: "Password",
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Feild is required";
                        }
                        if (p0.length <= 4) {
                          return "Password is too short";
                        }
                        return null;
                      },
                      obscured: isObsecured,
                      autoValidateMode: autoValidateMode,
                      inputType: TextInputType.visiblePassword,
                      suffixIcon: isObsecured
                          ? obscuredSuffixIcon
                          : notObscuredSuffixIcon,
                      onSuffixIconPressed: () {
                        setState(() {
                          isObsecured = !isObsecured;
                        });
                      },
                      onChanged: (p0) {
                        password = p0;
                      },
                    ),
                    Row(
                      children: [
                        const Text(
                          "Remember me ?",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Checkbox(
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          value: rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberMe = value;
                            });
                          },
                        ),
                      ],
                    ),
                    CustomBottom(
                        txt: "LOGIN",
                        isLoading: isLoading,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            Get.to(SelectFavMeal(),
                                transition: Transition.fadeIn);
                          } else {
                            autoValidateMode = AutovalidateMode.always;
                          }
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account ?",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () {},
                        //   child: const Text("SIGN UP"),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
