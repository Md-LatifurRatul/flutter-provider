import 'package:flutter/material.dart';
import 'package:flutter_provider/presentation/consts/product.dart';

class ProductsList {
  List<Product> Products = [
    Product(
      id: 0,
      name: 'Laptop',
      price: 30000,
      color: Colors.amber,
    ),
    Product(
      id: 1,
      name: 'Smartphone',
      price: 15000,
      color: Colors.red,
    ),
    Product(
      id: 2,
      name: 'Earphone',
      price: 1500,
      color: Colors.green,
    ),
    Product(
      id: 3,
      name: 'Smartwatch',
      price: 5000,
      color: Colors.blue,
    ),
  ];
}
