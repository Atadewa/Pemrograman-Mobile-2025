void main() {
  // String name = null; // Error, karena String default non-nullable
  String? name; // nullable, bisa menampung null

  if (name == null) {
    print('Nama saya belum diisi');
  } else {
    print('Nama saya adalah $name');
  }
}
