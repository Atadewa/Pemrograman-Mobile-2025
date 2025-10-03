import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: 'itemImage_${item.name}',
                child: Image.asset(item.image, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Rp ${item.price}', style: const TextStyle(color: Colors.deepOrange)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Stock: ${item.stock}'),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(item.rating.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}