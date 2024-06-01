import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanbuy/screens/homepage/components/Item_tile.dart';
import 'package:urbanbuy/screens/homepage/components/product_item_tile.dart';
import 'package:urbanbuy/screens/cart/cart_model.dart';

class SearchResultsPage extends StatefulWidget {
  final List<Map<String, dynamic>> searchResults;

  const SearchResultsPage({required this.searchResults, Key? key})
      : super(key: key);

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  final TextEditingController _searchController = TextEditingController();

  void _handleSearch() {
    String query = _searchController.text.toLowerCase();
    var searchResults =
        Provider.of<CartModel>(context, listen: false).searchProducts(query);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsPage(searchResults: searchResults),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Search Results'),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.search,
                          color: Colors.white, size: 30),
                      onPressed: _handleSearch,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: widget.searchResults.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                  ),
                  itemBuilder: (context, index) {
                    var item = widget.searchResults[index];
                    return ProductItemTile(
                      itemName: item["name"],
                      itemPrice: item["price"].toString(),
                      imagePath: item["imagePath"],
                      index:
                          item["originalIndex"], // Use the original index here
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemTile(
                              itemName: item["name"],
                              itemPrice: item["price"].toString(),
                              imagePath: item["imagePath"],
                              proDescription: item["description"],
                              index: item[
                                  "originalIndex"], // Pass the original index
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
