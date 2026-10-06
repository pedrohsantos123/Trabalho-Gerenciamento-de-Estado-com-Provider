import 'package:flutter/material.dart';
import '../controllers/cart_controller.dart';
import '../utils.dart';

/// Página que mostra os itens do carrinho, permite removê-los e exibe o total.
class CartPage extends StatelessWidget {
  final CartController cart;

  const CartPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: ListenableBuilder(
        listenable: cart,
        builder: (context, _) {
          if (cart.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.remove_shopping_cart,
                      size: 64, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('Seu carrinho está vazio',
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: cart.items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              item.product.color.withOpacity(0.15),
                          child: Icon(item.product.icon,
                              color: item.product.color),
                        ),
                        title: Text(item.product.name),
                        subtitle: Text(
                          '${item.quantity} x ${formatPrice(item.product.price)}'
                          '  =  ${formatPrice(item.subtotal)}',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.red),
                          tooltip: 'Remover',
                          onPressed: () => cart.remove(item.product),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: const [
                    BoxShadow(blurRadius: 6, color: Colors.black12)
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Total da compra'),
                          Text(
                            formatPrice(cart.totalPrice),
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      FilledButton(
                        onPressed: () {
                          cart.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Compra finalizada!')),
                          );
                        },
                        child: const Text('Finalizar'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
