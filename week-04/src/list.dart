void main() {
  final list = List<dynamic>.filled(5, null);

  list[1] = 'Aditya Atadewa';
  list[2] = 2341720174;

  print('NIM: ${list[1]}');
  print('Nama: ${list[2]}');

  print('\nIsi list: $list');
}
