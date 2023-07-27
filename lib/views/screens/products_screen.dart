import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:itmedicus/controller/product_controller.dart';
import 'package:itmedicus/models/product_model.dart';
import 'package:itmedicus/views/widgets/custom_floating_action_button_widget.dart';
import 'package:itmedicus/views/widgets/product_widget.dart';
import '../widgets/custom_navbar_widget.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final productController = Get.put(ProductController());
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf0f7ff),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue.withOpacity(0.5),
                            blurRadius: 30,
                            offset: const Offset(0, 10))
                      ]),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.chevron_left)),
                ),
                const SizedBox(
                  width: 100,
                ),
                Text(
                  "Products",
                  style: Theme.of(context).textTheme.displayMedium,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.blue,
                  border:
                      Border.all(color: Colors.blue.withOpacity(0.5), width: 8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue.withOpacity(0.8), blurRadius: 20)
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/itmedicus-project.appspot.com/o/banner.jpg?alt=media&token=321f3b54-bec3-4fd1-b34b-e8a012dc4252"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: searchController,
              onChanged: (query) {
                productController.filterProduct(query);
              },
              decoration: InputDecoration(
                  hintText: "Search here...",
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.blue,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  suffix: GestureDetector(
                      onTap: () {
                        searchController.clear();
                      },
                      child: CircleAvatar(
                          backgroundColor: Colors.blue.withOpacity(0.3),
                          radius: 12,
                          child: const Icon(
                            Icons.clear,
                            size: 20,
                            color: Colors.blue,
                          )))),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(() {
                if (productController.productList.isEmpty) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                } else {
                  return ListView.builder(
                      itemCount: productController.productList.length,
                      itemBuilder: (ctx, index) {
                        ProductModel product =
                            productController.productList[index];
                        return ProductWidget(
                            title: product.title,
                            subtitle: product.subtitle,
                            image: product.image,
                            createdAt: product.createdAt,
                            stock: product.stock);
                      });
                }
              }),
            )
          ],
        ),
      )),
      bottomNavigationBar: const CustomNavbarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: const CustomFloatingActionButtonWidget(),
    );
  }
}
