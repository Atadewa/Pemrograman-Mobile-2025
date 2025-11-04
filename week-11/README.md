# Pertemuan 11 - Pemrograman Asynchronous

**Nama : Aditya Atadewa**  
**Kelas : TI 3G**  
**NIM : 2341720174**  
**No. Absen : 01** 

---

## Praktikum 1: Mengunduh Data dari Web Service (API)

### Langkah 1: Membuat Project Baru

Membuat sebuah project flutter baru dengan nama `books` di folder src week-11. Kemudian menambahkan dependensi http dengan mengetik perintah berikut di terminal.

```terminal
flutter pub add http
```

**Output:**
![praktikum 1 langkah 1](./media/praktikum1.1.png)


### Langkah 2: Mengecek file `pubspec.yaml`

Memastikan plugin http telah ada di file `pubspec.yaml`

![praktikum 1 langkah 2](./media/praktikum1.2.png)

### Langkah 3: Mengubah file `main.dart`

#### Soal 1

> Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

Mengubah file `main.dart` menjadi seperti berikut.

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo - Atadewa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future - Atadewa'),
      ),
      body: Center(
        child: Column(children: [
          const Spacer(),
          ElevatedButton(
            child: const Text('GO!'),
            onPressed: () {},
          ),
          const Spacer(),
          Text(result),
          const Spacer(),
          const CircularProgressIndicator(),
          const Spacer(),
        ]),
      ),
    );
  }
}
```


### Langkah 4: Menambahkan method `getData()`

Menambahkan method ini ke dalam class `_FuturePageState` yang berguna untuk mengambil data dari API Google Books.

### Soal 2

> Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut.
> - Judul buku: Atomic Habits
> - ID buku: lFhbDwAAQBAJ

> Kemudian cobalah akses di browser URI tersebut dengan lengkap.
> - ![langkah 4 soal 2](./media/praktikum1.3.png)
> - Hasilnya menampilkan data JSON 

Method `getData()` pada `main.dart`

```dart
  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/lFhbDwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }
```

### Langkah 5: Menambah kode di `ElevatedButton`

Menambahkan  kode pada `onPressed` di `ElevatedButton` seperti berikut.

```dart
ElevatedButton(
  onPressed: () {
    setState(() {});
    getData()
        .then((value) {
          result = value.body.toString().substring(0, 450);
          setState(() {});
        })
        .catchError((_) {
          result = 'An error occurred';
          setState(() {});
        });
  },
  child: Text('Go!'),
),
```

#### Soal 3

> Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!
> - **Penjelasan substring**: `value.body.toString().substring(0, 450);` berfungsi untuk memotong teks hasil response sehingga hanya mengambil 450 karakter pertama. Hal tersebut dilakukan agar tampilan tidak terlalu panjang.
> - **Penjelasan `catchError`**: `catchError` digunakan untuk menangani error yang terjadi saat pemanggilan `getData()`. Jika terjadi kesalahan (misalnya koneksi gagal atau server tidak merespon), maka variabel result diisi dengan pesan 'An error occurred' dan UI diperbarui agar pengguna mengetahui bahwa ada masalah.

**Output yang dihasilkan:**

<img src="./media/praktikum1.gif" alt="Gif Output Praktikum 1" width="500">

---
