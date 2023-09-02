import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onPressed}) : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary:CupertinoColors.activeBlue,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            side: const BorderSide(color: CupertinoColors.activeBlue)
          ),
          onPressed: onPressed,
          child: Text(text,style: TextStyle(fontSize: 20),)),
    );
  }
}
