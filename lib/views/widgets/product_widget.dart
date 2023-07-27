import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final DateTime createdAt;
  final bool stock;

  const ProductWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.createdAt,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                blurRadius: 20,
                offset: const Offset(0, 2),
                spreadRadius: 0)
          ]),
      child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(image),
          ),
          title: Text(title),
          subtitle: Row(
            children: [
              Expanded(
                  child: Text(
                subtitle,
                style: const TextStyle(fontSize: 12),
              )),
              Expanded(
                  child: Text(DateFormat("MMM d, yyyy").format(createdAt),
                      style: const TextStyle(fontSize: 12)))
            ],
          ),
          trailing: stock
              ? const Text(
                  "Instock",
                  style: TextStyle(color: Colors.green),
                )
              : const Text("Out of stock",
                  style: TextStyle(color: Colors.red))),
    );
  }
}
