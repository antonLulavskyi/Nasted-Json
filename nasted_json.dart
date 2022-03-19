void main() {
  Map<String, dynamic> newMap = {
    'name': 'Mike',
    'age': 27,
    'city': 'Warsaw',
    'adress': [
      {
        'country': 'Poland',
        'city': 'Warsaw',
      },
      {
        'country': 'Ukraine',
        'city': 'Kyiv',
      }
    ],
  };

  var obj = Person.fromJson(newMap);
  print(obj.listOfAdresses!.last.city);
}

class Person {
  String? name;
  int? age;
  String? city;
  // List of map models
  List<Adress>? listOfAdresses;

  Person({this.name, this.age, this.city, this.listOfAdresses});
  // Initializing a Person passing a map(json)
  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    city = json['city'];
    if (json['adress'] != null) {
      // Create an empty list
      listOfAdresses = [];
      var listFromJson = json['adress'] as List;
      for (var element in listFromJson) {
        listOfAdresses!.add(Adress.fromJson(element));
      }
    }
  }
}

class Adress {
  String? country;
  String? city;

  Adress({this.country, this.city});

  Adress.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
  }
}
