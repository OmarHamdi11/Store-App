import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.txt, this.ontap});

  VoidCallback? ontap;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 173, 211, 112),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            txt,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
