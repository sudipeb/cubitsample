import 'package:cubitsample/domain/entities/name.dart';

abstract class NameRepository {
  List<Name> getAllNames();
  Name getRandomName();
}
