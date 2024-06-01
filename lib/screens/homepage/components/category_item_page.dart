import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:urbanbuy/screens/homepage/components/Item_tile.dart';
import 'package:urbanbuy/screens/homepage/components/product_item_tile.dart';
import 'package:urbanbuy/screens/cart/cart_model.dart';

class CategoryItemsPage extends StatelessWidget {
  final String category;

  const CategoryItemsPage({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<CartModel>(context).products;
    var categoryItems = products
        .where((product) =>
            product['category'].toLowerCase() == category.toLowerCase())
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '$category Items',
          style: GoogleFonts.notoSansRejang(),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: categoryItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
          ),
          itemBuilder: (context, index) {
            var item = categoryItems[index];
            return ProductItemTile(
              itemName: item["name"],
              itemPrice: item["price"].toString(),
              imagePath: item["imagePath"],
              index: products.indexOf(item), // Use the original index here
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemTile(
                      itemName: item["name"],
                      itemPrice: item["price"].toString(),
                      imagePath: item["imagePath"],
                      proDescription: item["description"],
                      index: products.indexOf(item), // Pass the original index
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
