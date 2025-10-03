// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';
import 'package:belanja/widgets/item_card.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {

final List<Item> items = [
  Item(
    name: 'Indomaret Salt',
    price: 10000,
    image: 'assets/images/garam.jpg',
    stock: 20,
    rating: 4.8,
    description: 'Table salt with iodine that will perfect every dish with the right amount of saltiness.',
  ),
  Item(
    name: 'Gulaku Sugar',
    price: 15000,
    image: 'assets/images/gula.jpg',
    stock: 50,
    rating: 4.7,
    description: 'Pure granulated sugar, perfect for baking and sweetening your drinks.',
  ),
  Item(
    name: 'Sari Wangi Tea',
    price: 5000,
    image: 'assets/images/teh.jpg',
    stock: 25,
    rating: 4.7,
    description: 'Freshly sourced tea leaves that offer a refreshing taste with every sip.',
  ),
  Item(
    name: 'Kapal Api Coffee',
    price: 2000,
    image: 'assets/images/kopi.png',
    stock: 10,
    rating: 4.9,
    description: 'Premium roasted coffee beans, perfect for brewing a cup of rich, aromatic coffee.',
  ),
  Item(
    name: 'Sedap Instant Noodles',
    price: 3000,
    image: 'assets/images/mie_instan.jpg',
    stock: 60,
    rating: 4.5,
    description: 'Quick and easy instant noodles, ready to be enjoyed in just minutes.',
  ),
  Item(
    name: 'Pronas Canned Tuna',
    price: 25000,
    image: 'assets/images/tuna_kaleng.jpg',
    stock: 15,
    rating: 4.6,
    description: 'Canned tuna packed in oil, perfect for quick meals and salads.',
  ),
  Item(
    name: 'Bango Soy Sauce',
    price: 9000,
    image: 'assets/images/kecap.jpg',
    stock: 40,
    rating: 4.7,
    description: 'Premium soy sauce, ideal for seasoning and marinating your dishes.',
  ),
  Item(
    name: 'MaduTJ Honey',
    price: 19000,
    image: 'assets/images/madu.jpg',
    stock: 12,
    rating: 4.9,
    description: 'Pure honey from natural sources, great for sweetening tea or as a spread.',
  ),
];

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(item.image, width: 50, height: 50),
              title: Text(item.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: \$${item.price}'),
                  Text('Stock: ${item.stock}'),
                  Text('Rating: ${item.rating}⭐'),
                  SizedBox(height: 5),
                  Text(item.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          );
        },
      ),
    ),
  ));
}


  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blitar Store')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              context.push('/item/${item.name}', extra: item);
            },
            child: ItemCard(item: item),
          );
        },
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Aditya Atadewa - 2341720174',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
