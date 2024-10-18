import 'package:flutter/material.dart';
import 'package:flutter_provider/presentation/consts/product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];
  List<Product> get items => _items;

  void addProduct(Product item) {
    _items.add(item);
    notifyListeners();
  }

  void removeProduct(int id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void removelAllProduct() {
    _items.clear();
    notifyListeners();
  }

  double getCartTotal() {
    return _items.fold(0, (previousValue, item) => previousValue + item.price);
  }
}
