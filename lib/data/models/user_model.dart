class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'] as int,
        name: map['name'] as String,
        username: map['username'] as String,
        email: map['email'] as String,
        address: Address.fromMap(map['address'] as Map<String, dynamic>),
        phone: map['phone'] as String,
        website: map['website'] as String,
        company: Company.fromMap(map['company'] as Map<String, dynamic>),
      );
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromMap(Map<String, dynamic> map) => Address(
        street: map['street'] as String,
        suite: map['suite'] as String,
        city: map['city'] as String,
        zipcode: map['zipcode'] as String,
        geo: Geo.fromMap(map['geo'] as Map<String, dynamic>),
      );
}

class Geo {
  final String lat;
  final String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromMap(Map<String, dynamic> map) => Geo(
        lat: map['lat'] as String,
        lng: map['lng'] as String,
      );
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromMap(Map<String, dynamic> map) => Company(
        name: map['name'] as String,
        catchPhrase: map['catchPhrase'] as String,
        bs: map['bs'] as String,
      );
}
