import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itmedicus/views/screens/home_screen.dart';

class CustomFloatingActionButtonWidget extends StatelessWidget {
  const CustomFloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue.withOpacity(0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 30,
                      offset: const Offset(0, 10))
                ]),
            child: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.blue,
            )),
      ),
    );
  }
}
