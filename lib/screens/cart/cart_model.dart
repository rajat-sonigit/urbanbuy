import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _products = [
    {
      "name": "Striped Shirt",
      "price": "120",
      "imagePath": "lib/assets/shirt.jpg",
      "description":
          "This stylish and comfortable striped shirt is perfect for any casual occasion. Made from high-quality cotton fabric, it features a classic black and white stripe pattern that adds a touch of sophistication to your look. Whether you're heading to work or hanging out with friends, this shirt is sure to keep you looking sharp and feeling great all day long.",
      "tag": "Men",
      "category": "Clothes"
    },
    {
      "name": "Nike Shoes",
      "price": "52",
      "imagePath": "lib/assets/shoes.jpg",
      "description":
          "Step up your sneaker game with these trendy Nike shoes. Designed for both style and performance, these shoes feature a sleek and modern design with a breathable mesh upper and cushioned midsole for maximum comfort. Whether you're hitting the gym or running errands, these shoes will keep you looking and feeling your best.",
      "tag": "Kids",
      "category": "Shoes"
    },
    {
      "name": "Pink T-shirt",
      "price": "80",
      "imagePath": "lib/assets/tshirt.jpg",
      "description":
          "Add a pop of color to your wardrobe with this vibrant pink t-shirt. Made from soft and stretchy cotton fabric, it offers a comfortable fit that's perfect for everyday wear. Pair it with your favorite jeans or shorts for a casual yet stylish look that's perfect for any occasion. Whether you're lounging at home or out and about, this t-shirt is sure to become a wardrobe staple.",
      "tag": "Men",
      "category": "Clothes"
    },
    {
      "name": "GAP T-Shirt",
      "price": "150",
      "imagePath": "lib/assets/tshirt2.jpg",
      "description":
          "Make a statement with this eye-catching graphic t-shirt. Featuring a bold and colorful design, it adds a fun and playful touch to any outfit. Made from premium cotton fabric, it offers a soft and comfortable feel that's perfect for all-day wear. Whether you're hitting the streets or hanging out with friends, this t-shirt is sure to turn heads wherever you go.",
      "tag": "Women",
      "category": "Clothes"
    },
    {
      "name": "Crocodile T-Shirt",
      "price": "100",
      "imagePath": "lib/assets/crocodiletshirt.jpg",
      "description":
          "Embrace a wild side with this crocodile-themed t-shirt. Crafted from high-quality cotton, this shirt features a unique crocodile graphic that's sure to catch attention. With its comfortable fit and stylish design, it's the perfect choice for adding a touch of personality to your casual wardrobe.",
      "tag": "Men",
      "category": "clothes"
    },
    {
      "name": "Graphic T-Shirt",
      "price": "100",
      "imagePath": "lib/assets/graphictshirt.jpg",
      "description":
          "Express yourself with this versatile graphic t-shirt. Featuring a cool and edgy design, it's perfect for adding a pop of style to any casual outfit. Made from soft cotton fabric, it offers a comfortable fit that's ideal for everyday wear. Whether you're hanging out with friends or running errands, this t-shirt is sure to become a favorite in your collection.",
      "tag": "Women",
      "category": "clothes"
    },
    {
      "name": "Oversized T-Shirt",
      "price": "100",
      "imagePath": "lib/assets/oversizedtshirt.jpg",
      "description":
          "Get cozy and stylish with this oversized t-shirt. Made from soft and breathable cotton fabric, it offers a relaxed fit that's perfect for lounging or casual outings. Pair it with leggings or jeans for a laid-back yet trendy look. Whether you're relaxing at home or out running errands, this t-shirt is a must-have for your wardrobe.",
      "tag": "Men",
      "category": "clothes"
    },
    {
      "name": "Nike Jordan",
      "price": "250",
      "imagePath": "lib/assets/shoecat.jpg",
      "description":
          "Elevate your sneaker game with these iconic Nike Jordans. Featuring a classic design and premium materials, these shoes offer both style and performance. Whether you're hitting the court or the streets, they provide the comfort and support you need to stay on top of your game. With their timeless appeal, Nike Jordans are a must-have addition to any sneaker collection.",
      "tag": "Unisex",
      "category": "Shoes"
    },
    {
      "name": "Vans-otw",
      "price": "125",
      "imagePath": "lib/assets/vansshoes.jpg",
      "description":
          "Step out in style with these classic Vans OTW sneakers. Combining comfort and versatility, these shoes are perfect for everyday wear. Whether you're skating at the park or hanging out with friends, they offer the perfect blend of style and functionality. With their iconic design and durable construction, Vans OTW sneakers are a wardrobe essential for any sneakerhead.",
      "tag": "Men",
      "category": "Shoes"
    },
    {
      "name": "Citizen Watch",
      "price": "300",
      "imagePath": "lib/assets/watchcat.jpg",
      "description":
          "Accessorize in style with this sleek Citizen watch. Featuring a classic design and precision Japanese quartz movement, this watch is both stylish and reliable. Whether you're dressing up for a special occasion or keeping it casual, it adds a touch of sophistication to any outfit. With its timeless appeal and superior craftsmanship, this Citizen watch is a must-have accessory for any modern man or woman.",
      "tag": "Men",
      "category": "Watch"
    }
  ];
  List _cartItems = [];
  get products => _products;
  get cartItems => _cartItems;
  //adding item to cart
  void addItemToCart(int index) {
    _cartItems.add(_products[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // calculate total price
  double calculateSubtotal() {
    return _cartItems.fold(0, (sum, item) => sum + item['price']);
  }

  double calculateDiscount() {
    return _cartItems.fold(
        0,
        (sum, item) =>
            sum + (item['originalPrice'] ?? item['price']) - item['price']);
  }

  double calculateTotal() {
    double subtotal = calculateSubtotal();
    double vat = 1.3;
    return subtotal + vat;
  }

  List<Map<String, dynamic>> searchProducts(String query) {
    List<Map<String, dynamic>> results = [];
    query = query.toLowerCase();

    for (int i = 0; i < _products.length; i++) {
      final product = _products[i];
      final nameMatch = product['name'].toLowerCase().contains(query);
      final descriptionMatch =
          product['description'].toLowerCase().contains(query);
      final tagMatch = product['tag'].toLowerCase().contains(query);

      if (nameMatch || descriptionMatch || tagMatch) {
        Map<String, dynamic> productWithIndex = Map.from(product);
        productWithIndex["originalIndex"] = i;
        results.add(productWithIndex);
      }
    }

    return results;
  }
}
