import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /* soal 1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* soal 2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Gunung Kelud',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Kediri, Jawa Timur, Indonesia',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          /* soal 3*/
          Icon(Icons.star_border, color: Colors.red),
          const Text('41'),
        ],
      ),
    );

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Keindahan Gunung Kelud terletak pada kawah aktifnya yang mempesona, dikelilingi lanskap dramatis pegunungan yang hijau dan udara segar.\n'
        'Aditya Atadewa - 2341720174. ',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Aditya Atadewa - 2341720174',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layout demo')),
        body: ListView(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  'images/gunung_kelud.jpg',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    color: Colors.black54,
                    child: const Text(
                      'Wisata Gunung Kelud',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            titleSection,
            Card(
              elevation: 4.0,
              margin: EdgeInsets.all(16.0),
              child: Column(children: [buttonSection, textSection]),
            ),
          ],
        ),
      ),
    );
  }
}
