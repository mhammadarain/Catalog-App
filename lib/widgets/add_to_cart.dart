import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import '../models/cart.dart';
import '../models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    // bool isInCart = _cart.item.contains(widget.catalog) ?? false;
    bool isInCart = _cart.item.contains(widget.catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final catalog = CatalogModel();

            _cart.catalog = catalog;
            _cart.add(widget.catalog);
            setState(() {});
          }
        },
        child: isInCart ? const Icon(Icons.done) : const Icon(Icons.add));
  }
}
