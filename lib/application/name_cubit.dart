import 'package:bloc/bloc.dart';
import 'package:cubitsample/domain/entities/name.dart';
import 'package:cubitsample/domain/repositories/name_repositories.dart';

//cubit for managing the name state
class NameCubit extends Cubit<Name?> {
  final NameRepository _repository;
  NameCubit(this._repository) : super(null);
  //emiting the value of selected random name in a function
  void pickRandomName() => emit(_repository.getRandomName());
}
