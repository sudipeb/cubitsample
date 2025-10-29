import 'package:bloc/bloc.dart';
import 'package:cubitsample/domain/entities/name.dart';
import 'package:cubitsample/domain/repositories/name_repositories.dart';

class NameCubit extends Cubit<Name?> {
  final NameRepository _repository;
  NameCubit(this._repository) : super(null);
  void pickRandomName() => emit(_repository.getRandomName());
}
