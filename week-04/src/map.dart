void main() {
  var gifts = {
    'first': 'partridge', 
    'second': 'turtledoves', 
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2
  };

  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  gifts['third'] = 'Aditya Atadewa';
  gifts['fourth'] = '2341720174';

  nobleGases[22] = 'Aditya Atadewa';
  nobleGases[37] = '2341720174';

  var mhs1 = Map<String, String>();
  mhs1['nama'] = 'Aditya Atadewa';
  mhs1['nim'] = '2341720174';

  var mhs2 = Map<int, String>();
  mhs2[1] = 'Aditya Atadewa';
  mhs2[2] = '2341720174';

  print('Isi Map gifts: $gifts');
  print('Isi Map nobleGases: $nobleGases');
  print('Isi Map mhs1: $mhs1');
  print('Isi Map mhs2: $mhs2');
}
