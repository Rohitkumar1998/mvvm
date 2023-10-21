import 'package:flutter/material.dart';
import 'package:mvvm/resourses/color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPresed});
  final String title;
  final loading;
  final VoidCallback onPresed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPresed,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(color: AppColors.White),
                  )),
      ),
    );
  }
}
