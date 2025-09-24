# Pertemuan 5 - Aplikasi Pertama dan Widget Dasar Flutter

**Nama : Aditya Atadewa**  
**Kelas : TI 3G**  
**NIM : 2341720174**  
**No. Absen : 01**

---

## Praktikum 1: Membuat Project Flutter Baru

### Membuat Project Hello World

![Screenshoot Project Hello World](./hello_world/images/praktikum1.png)

---

## Praktikum 2: Menghubungkan Perangkat Android atau Emulator

### Menjalankan Aplikasi ke Perangkat Fisik (device Android atau iOS)

![Foto Connect Device Android](./hello_world/images/praktikum2.jpg)

---

## Praktikum 3: Membuat Repository GitHub dan Laporan Praktikum

### Langkah 11

 Mencoba running project `hello_world` menggunakan browser Chrome.

**Output yang dihasilkan:**

![Screenshoot langkah 12](./hello_world/images/praktikum3.1.png)

### Langkah 12

Menampilkan nama lengkap dalam aplikasi.

**Output yang dihasilkan:**

![Screenshoot langkah 12](./hello_world/images/praktikum3.2.png)

**Bonus GIF**

![GIF langkah 12](./hello_world/gif/praktikum3.3.gif)

---

## Praktikum 4: Menerapkan Widget Dasar

### Langkah 1: Text Widget

Membuat folder baru `basic_widgets` di dalam folder `lib`, kemudian membuat file baru di dalam `basic_widgets` dengan nama `text_widget.dart`.

Mengetik kode program berikut ke project `hello_world` pada file `text_widget.dart`.

```dart
import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Nama saya Fulan, sedang belajar Pemrograman Mobile",
      style: TextStyle(color: Colors.red, fontSize: 14),
      textAlign: TextAlign.center);
  }
}
```

Melakukan import file `text_widget.dart` ke `main.dart`, lalu mengganti bagian text widget dengan kode di atas.

**Output yang Dihasilkan:**

![praktikum 4 langkah 1](./hello_world/images/praktikum4.1.png)

### Langkah 2: Image Widget

Membuat sebuah file `image_widget.dart` di dalam folder `basic_widgets` dengan isi kode program berikut.

```dart
import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage("logo_polinema.jpg")
    );
  }
}
```

Menyesuaikan kode dan import di file `main.dart`.

**Output yang Dihasilkan:**

![praktikum 4 langkah 2](./hello_world/images/praktikum4.2.png)

---

## Praktikum 5 - Menerapkan Widget Material Design dan iOS Cupertino

### Langkah 1: Cupertino Button dan Loading Bar

Membuat file di `basic_widgets > loading_cupertino.dart`. Import stateless widget dari material dan cupertino. Lalu mengisi kode di dalam method Widget build sebagai berikut

```dart
return MaterialApp(
      home: Container(
        margin: const EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            CupertinoButton(
              child: const Text("Contoh button"),
              onPressed: () {},
            ),
            const CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
```

**Output yang dihasilkan:**

![praktikum 5 langkah 1](./hello_world/images/praktikum5.1.png)

### Langkah 2: Floating Action Button (FAB)

Membuat file di `basic_widgets > fab_widget.dart`. Import stateless widget dari material. Lalu mengisi kode di dalam method Widget build sebagai berikut.

```dart
return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(Icons.thumb_up),
          backgroundColor: Colors.pink,
        ),
      ),
    );
```

**Output yang dihasilkan:**

![praktikum 5 langkah 2](./hello_world/images/praktikum5.2.png)

### Langkah 3: Scaffold Widget

Mengubah isi kode main.dart seperti berikut

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'My Increment App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
```

**Output yang dihasilkan:**

![praktikum 5 langkah 3](./hello_world/images/praktikum5.3.png)

### Langkah 4: Dialog Widget

Mengubah isi kode main.dart seperti berikut

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyLayout(),
      ),
    );
  }
}

class MyLayout extends StatelessWidget {
  const MyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Text('Show alert'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("My title"),
    content: const Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
```

**Output yang dihasilkan:**

 dihasilkan:**

![praktikum 5 langkah 4](./hello_world/gif/praktikum5.4.gif)

### Langkah 5: Input dan Selection Widget

Contoh penggunaan TextField widget adalah sebagai berikut:

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Contoh TextField")),
        body: const TextField(
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nama',
          ),
        ),
      ),
    );
  }
}
```

**Output yang dihasilkan:**

![praktikum 5 langkah 5](./hello_world/images/praktikum5.5.png)

### Langkah 6: Date and Time Pickers

Date and Time Pickers termasuk pada kategori input dan selection widget, berikut adalah contoh penggunaan Date and Time Pickers.

```dart
import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contoh Date Picker',
      home: MyHomePage(title: 'Contoh Date Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variable/State untuk mengambil tanggal
  DateTime selectedDate = DateTime.now();

  //  Initial SelectDate FLutter
  Future<void> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => {
                _selectDate(context),
                // ignore: avoid_print
                print(selectedDate.day + selectedDate.month + selectedDate.year)
              },
              child: const Text('Pilih Tanggal'),
            ),
          ],
        ),
      ),
    );
  }
}
```

**Output yang dihasilkan:**

![praktikum 5 langkah 6.1](./hello_world/images/praktikum5.6.png)

![praktikum 5 langkah 6.2](./hello_world/images/praktikum5.7.png)

--- 

## Codelabs: Your First Flutter App

**Output Aplikasi:**

![gambar 1](./aditya_app/images/01.png)

![gambar 2](./aditya_app/images/02.png)

![gambar 3](./aditya_app/images/03.png)

**Output (GIF):**

![gif](./aditya_app/gif/01.gif)