void main() {
  for (var i = 0; i <= 201; i++) {
    if (i <= 1) continue;

    if (i == 2) {
      print("Aditya Atadewa - 2341720174 - Angka $i merupakan Bilangan Prima");
      continue;
    }

    if (i % 2 == 0) continue;

    bool isPrime = true;

    for (var j = 3; j <= i ~/ 2; j += 2) {
      if (i % j == 0) {
        isPrime = false;
        break;
      }
    }

    if (isPrime) print("Aditya Atadewa - 2341720174 - Angka $i merupakan Bilangan Prima");
  }
}