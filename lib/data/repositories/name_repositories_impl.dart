import 'package:cubitsample/core/extensions/iterable_extension.dart';
import 'package:cubitsample/domain/entities/name.dart';
import 'package:cubitsample/domain/repositories/name_repositories.dart';

class NameRepositoryImpl implements NameRepository {
  final List<Name> _names = const [
    Name('Ram'),
    Name('Shyam'),
    Name('Hari'),
    Name('Gita'),
    Name('Sita'),
    Name('John'),
    Name('Doe'),
    Name('Jane'),
    Name('Smith'),
    Name('Emily'),
  ];
  @override
  List<Name> getAllNames() {
    return _names;
  }

  @override
  Name getRandomName() {
    return _names.getRandomElement();
  }
}
