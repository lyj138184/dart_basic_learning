void main(List<String> args) {
  var promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  /* var list = [1, 2, 3];
   var list2 = [0, ...list];
   assert(list2.length == 4); */
  /*  var list = [1, 2, 3];
   var list2 = [0, ...?list];
   assert(list2.length == 1); */

  /*  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  var gifts2 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var nobleGases2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon'; */

  /*  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  var names = <String>{};
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  print(names); */

  // var list = [1, 2, 3];
  // assert(list.length == 3);
  // assert(list[1] == 2);

  // list[1] = 1;
  // assert(list[1] == 1);
  // var constantList = const [1, 2, 3];
  // print(constantList[1] = 1);
}
