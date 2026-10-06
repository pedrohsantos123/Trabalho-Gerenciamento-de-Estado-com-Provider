import 'package:flutter/material.dart';
import '../models/product.dart';

const List<Product> availableProducts = [
  Product(
    id: 1,
    name: 'Fone de Ouvido',
    description: 'Fone Bluetooth com cancelamento de ruído.',
    price: 199.90,
    icon: Icons.headphones,
    color: Colors.indigo,
  ),
  Product(
    id: 2,
    name: 'Smartwatch',
    description: 'Relógio inteligente com monitor cardíaco.',
    price: 349.00,
    icon: Icons.watch,
    color: Colors.teal,
  ),
  Product(
    id: 3,
    name: 'Teclado Mecânico',
    description: 'Teclado com iluminação RGB.',
    price: 259.50,
    icon: Icons.keyboard,
    color: Colors.deepOrange,
  ),
  Product(
    id: 4,
    name: 'Mouse Gamer',
    description: 'Mouse óptico de alta precisão.',
    price: 129.99,
    icon: Icons.mouse,
    color: Colors.purple,
  ),
  Product(
    id: 5,
    name: 'Câmera',
    description: 'Câmera digital Full HD.',
    price: 899.00,
    icon: Icons.camera_alt,
    color: Colors.blueGrey,
  ),
  Product(
    id: 6,
    name: 'Notebook',
    description: 'Notebook 15" com 8GB de RAM.',
    price: 2999.90,
    icon: Icons.laptop,
    color: Colors.green,
  ),
];
