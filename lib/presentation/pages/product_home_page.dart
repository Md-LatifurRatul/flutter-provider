import 'package:flutter/material.dart';
import 'package:flutter_provider/presentation/consts/product.dart';
import 'package:flutter_provider/presentation/model/products_list.dart';
import 'package:flutter_provider/presentation/pages/cart_page.dart';
import 'package:flutter_provider/presentation/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductHomePage extends StatelessWidget {
  const ProductHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsList _products = ProductsList();
    return Scaffold(
      appBar: _homeAppBar(context),
      body: _buildHomeUI(context, _products),
    );
  }

  PreferredSizeWidget _homeAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Products'),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          },
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }

  Widget _buildHomeUI(BuildContext context, ProductsList productList) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return ListView.builder(
      itemCount: productList.Products.length,
      itemBuilder: (context, index) {
        Product product = productList.Products[index];

        return ListTile(
          leading: Container(
            height: 25,
            width: 25,
            color: product.color,
          ),
          title: Text(product.name),
          trailing: Checkbox(
            value: cartProvider.items.any((item) => item.id == product.id),
            onChanged: (value) {
              if (value == true) {
                cartProvider.addProduct(product);
              } else {
                cartProvider.removeProduct(product.id);
              }
            },
          ),
        );
      },
    );
  }
}
