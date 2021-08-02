import 'package:objectbox/objectbox.dart';

@Entity()
class PersonModel {
  int id;
  String name;
  String address;
  String mobile;

  PersonModel({
    this.id = 0,
    required this.name,
    required this.address,
    required this.mobile,
  });
}



/*

@Entity()
class PersonEntity {
  int id;
  String name;
  @Backlink()
  final personDetails = ToMany<PersonsDetails>();

  PersonEntity({
    this.id = 0,
    required this.name,
  });
}

@Entity()
class PersonsDetails {
  int id;
  String address;
  String mobile;
  final personEntity = ToOne<PersonEntity>();

  PersonsDetails({
    this.id = 0,
    required this.address,
    required this.mobile,
  });
}

*/