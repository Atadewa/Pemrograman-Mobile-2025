# Pertemuan 14 - RESTful API

**Nama : Aditya Atadewa**  
**Kelas : TI 3G**  
**NIM : 2341720174**  
**No. Absen : 01** 

---

## Praktikum 1: Membuat layanan Mock API

### Langkah 1: Masuk ke Layanan Mock Lab

![Praktikum 1 langkah 1](./media/praktikum1.1.png)

### Langkah 2: Membuat Endpoint API Baru

Klik pada tombol New. Untuk Namanya, ketik Pizza List, biarkan GET sebagai verb, dan di kotak teks di dekat verb GET, ketik /pizzalist. Kemudian, di bagian Response, untuk status 200, pilih JSON sebagai format dan tempel konten JSON yang tersedia di `https://bit.ly/pizzalist`.

![Praktikum 1 langkah 2](./media/praktikum1.2.png)

### Langkah 3: Menambahkan Dependensi HTTP

Mengetik perintah berikut di terminal.

```terminal
flutter pub add http
```

![Praktikum 1](./media/praktikum1.3.png)

### Langkah 4: Membuat file baru `httphelper.dart`

```dart
import 'dart:io'; 
import 'package:http/http.dart' as http; 
import 'dart:convert'; 
import 'pizza.dart'; 

class HttpHelper {
  final String authority = '6woqv.wiremockapi.cloud';
  final String path = 'pizzalist';
  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      //provide a type argument to the map method to avoid type 
      //error
      List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) => 
            Pizza.fromJson(i)).toList();
      return pizzas;
    } else {
      return [];
    }
  }
}
```

### Langkah 5: Menambahkan method `callPizzas`

Di file `main.dart`, di kelas `_MyHomePageState`, ditambahkan method bernama `callPizzas`. Hal tersebut mengembalikan `Future` dari List objek Pizza dengan memanggil method `getPizzaList` dari kelas `HttpHelper`, sebagai berikut:

```dart
Future<List<Pizza>> callPizzas() async {
  HttpHelper helper = HttpHelper(); 
  List<Pizza> pizzas = await helper.getPizzaList(); 
  return pizzas; 
} 
```

### Langkah 6: Menambahkan `FutureBuilder`

Di metode build dari kelas `_MyHomePageState`, di body `Scaffold` ditambahkan `FutureBuilder` yang membangun `ListView` dari widget `ListTile` yang berisi objek `Pizza`.

```dart
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('RESTful API - Atadewa'),
      backgroundColor: Colors.lightBlueAccent,
    ),
    body: FutureBuilder(
      future: callPizzas(),
      builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        return ListView.builder(
          itemCount: (snapshot.data == null) ? 0 : snapshot.data!.length,
          itemBuilder: (BuildContext context, int position) {
            return ListTile(
              title: Text(snapshot.data![position].pizzaName),
              subtitle: Text(
                snapshot.data![position].description +
                    ' - € ' +
                    snapshot.data![position].price.toString(),
              ),
            );
          },
        );
      },
    ),
  );
}
```

### Langkah 7: Running Aplikasi

#### Soal 1

> - Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.
> - Gantilah warna tema aplikasi sesuai kesukaan Anda.
>
>   ```dart
>      Widget build(BuildContext context) {
>        return MaterialApp(
>          title: 'RESTful API - Atadewa',
>          theme: ThemeData(primarySwatch: Colors.lightBlue),
>          home: const MyHomePage(),
>        );
>      }
>   ```
>
> - Capture hasil aplikasi Anda, lalu masukkan ke laporan di README.
> 
>   <img src="./media/praktikum1.4.jpg" alt="soal 1" width="400">
