import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: 1,
      width: double.infinity,
    );
  }
}
