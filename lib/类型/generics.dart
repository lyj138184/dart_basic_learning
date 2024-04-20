void main(List<String> args) {
  var names = <String>['Seth', 'Kathy', 'Lars'];
  var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
  var pages = <String, String>{
    'index.html': 'Homepage',
    'robots.txt': 'Hints for web robots',
    'humans.txt': 'We are people, not machines'
  };

  var names2 = <String>[];
  names.addAll(['Seth', 'Kathy', 'Lars']);
  print(names2 is List<String>); 
}