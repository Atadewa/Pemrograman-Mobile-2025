void main() {
  // List<int?> list1 = [1, 2, 3];
  // var list2 = [0, ...list1];

  // print(list1);
  // print(list2);
  // print(list2.length);

  // list1 = [1, 2, null];
  // print(list1);

  // var listNIM = [2, 3, 4, 1, 7, 2, 0, 1, 7, 4]; // NIM: 2341720174

  // var list3 = [0, ...?list1, ...listNIM];
  // print(list3.length);
  // print(list3);

  // var promoActive = false;

  // var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  // print(nav);

  // var login = 'Employee';

  // var nav2 = [
  //   'Home',
  //   'Furniture',
  //   'Plants',
  //   if (login case 'Manager') 'Inventory',
  // ];

  // print(nav2);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}
