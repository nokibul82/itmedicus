import 'package:flutter/material.dart';

class CustomFloatingActionButtonWidget extends StatelessWidget {
  const CustomFloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.blue.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 10,
      child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: const Icon(
            Icons.notifications_none_outlined,
            color: Colors.blue,
          )),
    );
  }
}
