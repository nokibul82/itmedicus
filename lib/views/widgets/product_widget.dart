import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {

  final String title;
  final String subtitle;
  final String image;
  final DateTime createdAt;
  final bool stock;

  const ProductWidget({
    super.key, required this.title, required this.subtitle, required this.image, required this.createdAt, required this.stock,

  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(child: Image.network(image),),
      title: Text(title),
      subtitle: Text(title),
      trailing: stock ? const Text("Instock") :const Text("Out of stock")
    );
  }
}
