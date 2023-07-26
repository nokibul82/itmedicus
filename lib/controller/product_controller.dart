import 'package:get/get.dart';
import 'package:itmedicus/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductController extends GetxController {
  final _db = FirebaseFirestore.instance;

  List productList = [].obs;

  Future getAllProducts() async {
    final snapshot = await _db.collection("products").get();
    productList = snapshot.docs
        .map((product) => ProductModel(
            id: product.id,
            title: product["title"],
            subtitle: product["subtitle"],
            image: product["image"],
            createdAt: product["created_at"],
            stock: product["stock"]))
        .toList();
    print("Get All Product Called");
  }
}
