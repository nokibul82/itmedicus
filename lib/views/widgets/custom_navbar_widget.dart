import 'package:flutter/material.dart';
import 'my_app_icons.dart';

class CustomNavbarWidget extends StatelessWidget {
  const CustomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 80,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.blue.withOpacity(0.5), blurRadius: 30)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.blue,
                            blurRadius: 20,
                            offset: Offset(0, 13))
                      ]),
                  child: const Icon(
                    MyAppIcon.home,
                    color: Colors.white,
                  )),
            ),
            GestureDetector(
                onTap: () {},
                child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 1,color: Colors.black)
                    ),
                    child: Icon(Icons.person_2_outlined)))
          ],
        ),
      ),
    );
  }
}
