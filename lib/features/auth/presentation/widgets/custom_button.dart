import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom(
      {super.key, required this.txt, this.onTap, this.isLoading = false});
  final String txt;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? () {} : onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:const Color(0xff7F59D0),
        ),
        child: ConditionalBuilder(
          condition: isLoading,
          builder: (context) {
            return const Center(child: CircularProgressIndicator(color: Colors.white,));
          },
          fallback: (context) => Center(
            child: Text(
              txt,
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}