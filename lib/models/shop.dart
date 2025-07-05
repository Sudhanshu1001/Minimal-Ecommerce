import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/models/product.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    //product1
    Product(description: "Item description", name: "Product1", price: 99.99, imagePath: 'lib/images/bag.jpg'),

    //Product 2
    Product(description: "Item description", name: "Product2", price: 99.99,imagePath: 'lib/images/cap.jpg'),

    // product 3
    Product(description: "Item description", name: "Product3", price: 99.99,imagePath: 'lib/images/jacket.jpg'),

    //product 4
    Product(description: "Item description", name: "Product4", price: 99.99,imagePath: 'lib/images/shirt.jpg'),
  ];

  //user cart
  final List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item to cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
