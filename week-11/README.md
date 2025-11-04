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

#### Soal 2

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

## Praktikum 2: Menggunakan await/async untuk Menghindari Callbacks

### Langkah 1: Mengubah file `main.dart`

Menambahkan tiga method berisi kode seperti berikut di dalam class `_FuturePageState`.

```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}

Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}

Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```

### Langkah 2: Menambahkan method `count()`

Menambahkan lagi method `count()` di bawah ketiga method pada langkah 1.

```dart
Future count() async {
  int total = 0;
  total = await returnOneAsync();
  total += await returnTwoAsync();
  total += await returnThreeAsync();
  setState(() {
    result = total.toString();
  });
}
```

### Langkah 3: Memanggil `count()`

Melakukan comment kode sebelumnya, kemudian mengubah isi kode `onPressed()` menjadi seperti berikut.

```dart
ElevatedButton(
  child: Text('GO!'),
  onPressed: () {
    count();
  },
),
```

### Langkah 4: Run

Melakukan running aplikasi.

#### Soal 4

> Jelaskan maksud kode langkah 1 dan 2 tersebut!
> 
> **Penjelasan Langkah 1:**
> - Ketiga method pada langkah 1 (`returnOneAsync`, `returnTwoAsync`, `returnThreeAsync`) adalah fungsi asynchronous yang menggunakan await `Future.delayed(Duration(seconds: 3))` untuk mensimulasikan proses yang memerlukan waktu, seperti mengambil data dari server.
> - Setelah jeda 3 detik, masing-masing mengembalikan nilai 1, 2, dan 3.
>
> **Penjelasan Langkah 2:**
> Method `count()` melakukan:
> - Mendeklarasikan variabel total.
> - Menjalankan ketiga fungsi asynchronous sebelumnya secara berurutan menggunakan `await` (total waktu menunggu 9 detik).
>   - `await returnOneAsync()` → menunggu 3 detik
>   - `await returnTwoAsync()` → menunggu 3 detik lagi
>   - `await returnThreeAsync()` → menunggu 3 detik lagi
> - Menjumlahkan hasilnya ke dalam total.
> - Memanggil setState untuk mengubah nilai result pada UI sesuai total yang diperoleh (total = 6).

**Output yang dihasilkan:**

<img src="./media/praktikum2.gif" alt="Gif Output Praktikum 2" width="500">

Hasil angka 6 akan tampil setelah delay 9 detik.

---

## Praktikum 3: Menggunakan Completer di Future

### Langkah 1: Menambahkan Kode di `main.dart`

Mengimpor package `async` berikut.

```dart
import 'package:async/async.dart';
```

### Langkah 2: Menambahkan Variabel dan Method

Menambahkan variabel `late` dan method di class `_FuturePageState` seperti berikut ini.

```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds : 5));
  completer.complete(42);
}
```

### Langkah 3: Mengganti isi kode `onPressed()`

Menambahkan kode berikut pada fungsi `onPressed()` dan melakukan comment pada kode sebelumnya.

```dart
getNumber().then((value) {
  setState(() {
    result = value.toString();
  });
});
```

### Langkah 4: Running Aplikasi

#### Soal 5

> Jelaskan maksud kode langkah 2 tersebut!
>
> Pada langkah 2, digunakan Completer untuk membuat Future secara manual.
> - Completer dipakai untuk mengontrol sendiri kapan sebuah Future dianggap selesai.
> - `getNumber()` membuat `Future` baru, lalu memanggil `calculate()`.
> - `calculate()` menunggu 5 detik, lalu menyelesaikan `Future` dengan `completer.complete(42)`.
> - Sehingga, setelah menekan tombol, perlu untuk menunggu selama 5 detik sebelum hasil 42 ditampilkan di UI.

**Output yang dihasilkan:**

<img src="./media/praktikum3.gif" alt="Gif Output Praktikum 3" width="500">

### Langkah 5: Mengubah method `calculate()`

Mengubah isi code method `calculate()` menjadi seperti berikut.

```dart
calculate() async {
  try {
    await new Future.delayed(const Duration(seconds: 5));
    completer.complete(42);
    // throw Exception();
  } catch (_) {
    completer.completeError({});
  }
}
```

### Langkah 6: Mengubah kode pada `onPressed()`

Mengubah kode menjadi seperti berikut.

```dart
getNumber().then((value) {
  setState(() {
    result = value.toString();
  });
}).catchError((e) {
  result = 'An error occurred';
});
```

#### Soal 6

> Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!
> - Pada langkah 2, `calculate()` diasumsikan selalu berhasil sehingga `Future` hanya dipenuhi dengan complete(42).
> - Sedangkan pada langkah 5, `calculate()` dibuat lebih realistis, yaitu bisa terjadi error. Oleh karena itu `completer.completeError(e);` digunakan saat terjadi kesalahan.
> - Lalu pada langkah 6, tombol menangani kemungkinan error tersebut dengan `.catchError(...)` sehingga aplikasi menampilkan pesan "An error occurred" tanpa crash.

**Output yang dihasilkan:**

<img src="./media/praktikum3.gif" alt="Gif Output Praktikum 3" width="500">