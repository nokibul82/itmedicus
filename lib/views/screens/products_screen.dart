import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itmedicus/views/widgets/custom_floating_action_button_widget.dart';
import '../widgets/custom_navbar_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Products",style: Theme.of(context).textTheme.displayMedium,),
      ),
      body: const SafeArea(child: SizedBox()),
      bottomNavigationBar: const CustomNavbarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: const CustomFloatingActionButtonWidget(),
    );
  }
}
