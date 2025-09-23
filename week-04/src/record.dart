(int, int) tukar((int, int) record) {
  var (a, b) = record; 
  return (b, a);
}

void main() {
  // var record = ('first', a: 2, b: true, 'last');
  // print(record);

  // var angka = (5, 7);
  // print('\nRecord awal: $angka');

  // var angkaBaru = tukar(angka);
  // print('Record baru setelah ditukar: $angkaBaru');

  // Record type annotation in a variable declaration:
  // (String, int) mahasiswa;
  // mahasiswa = ('Aditya Atadewa', 2341720174);

  // print(mahasiswa);

  var mahasiswa2 = ('first', a: 2, b: true, 'last');

  print(mahasiswa2.$1);
  print(mahasiswa2.a);
  print(mahasiswa2.b);
  print(mahasiswa2.$2);

  mahasiswa2 = ('Aditya Atadewa', a: 2341720174, b: true, 'Politeknik Negeri Malang');

  print('\nRecord mahasiswa2: $mahasiswa2');

  print(mahasiswa2.$1);
  print(mahasiswa2.a);
  print(mahasiswa2.b);
  print(mahasiswa2.$2);
}
