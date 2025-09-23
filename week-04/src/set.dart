void main() {
  // var hologens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // print(hologens);

  var names1 = <String>{};
  Set<String> names2 = {};

  names1.add('2341720174');
  names1.add('Aditya Atadewa');

  names2.addAll({'2341720174, Aditya Atadewa'});

  print('Isi Set names1: $names1');
  print('Isi Set names2: $names2');
}
