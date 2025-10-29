import 'package:cubitsample/domain/entities/name.dart';

abstract class NameRepository {
  //for list of names
  List<Name> getAllNames();
  //for single name
  Name getRandomName();
}
