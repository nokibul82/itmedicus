import 'package:get/get.dart';
import 'package:itmedicus/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductController extends GetxController {
  final _db = FirebaseFirestore.instance;

  var productList = <ProductModel>[].obs;
  var filteredList = <ProductModel>[].obs;

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  Future<void> getAllProducts() async {
    try {
      final snapshot = await _db.collection("products").get();
      productList.value = snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
      print("=========================");
      print("Get All Product Called");
    } catch (e) {
      print("=========================");
      print("Error fetching books: $e");
    }
  }

  void filterProduct(String query) {
    if (query.isEmpty) {
      filteredList.value = productList;
    } else {
      filteredList.value = productList
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()) ||
              product.subtitle.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

// ProductModel(
//     id: "1",
//     title: "Sargel",
//     subtitle: "Esomeprazole",
//     image:
//         "https://firebasestorage.googleapis.com/v0/b/itmedicus-project.appspot.com/o/Sergel.jpg?alt=media&token=39393c28-b68d-4ca5-b810-ade0f556304b",
//     createdAt: DateTime.now().toIso8601String(),
//     stock: "true"),
