import 'package:flutter/material.dart';
import '../controllers/cart_controller.dart';
import '../data/products_data.dart';
import '../models/product.dart';
import '../utils.dart';
import 'cart_page.dart';

/// Página que apresenta os produtos e permite adicioná-los ao carrinho.
class ProductPage extends StatelessWidget {
  final CartController cart;

  const ProductPage({super.key, required this.cart});

  void _addToCart(BuildContext context, Product product) {
    cart.add(product);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('${product.name} adicionado ao carrinho'),
          duration: const Duration(seconds: 1),
        ),
      );
  }

  void _openCart(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CartPage(cart: cart)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          ListenableBuilder(
            listenable: cart,
            builder: (context, _) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Badge(
                isLabelVisible: cart.totalItems > 0,
                label: Text('${cart.totalItems}'),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  tooltip: 'Abrir carrinho',
                  onPressed: () => _openCart(context),
                ),
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 240,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.72,
        ),
        itemCount: availableProducts.length,
        itemBuilder: (context, index) {
          final product = availableProducts[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: product.color.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(product.icon, size: 56, color: product.color),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    formatPrice(product.price),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () => _addToCart(context, product),
                      icon: const Icon(Icons.add_shopping_cart, size: 18),
                      label: const Text('Adicionar'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
