import 'package:flutter/material.dart';
import 'package:flutter_provider/presentation/consts/product.dart';
import 'package:flutter_provider/presentation/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _cartAppbar(),
      body: _buildCartUI(),
    );
  }

  PreferredSizeWidget _cartAppbar() {
    return AppBar(
      title: const Text('Cart Page'),
      automaticallyImplyLeading: true,
    );
  }

  Widget _buildCartUI() {
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.80,
              child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  Product product = provider.items[index];
                  return ListTile(
                    title: Text(
                      product.name,
                    ),
                    onLongPress: () {
                      provider.removeProduct(product.id);
                    },
                  );
                },
              ),
            ),
            Text('Cart Total: \$${provider.getCartTotal()}')
          ],
        );
      },
    );
  }
}
