import 'package:bloc/bloc.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/home/data/repo/repository/home_repository_contract.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepositoryContract _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeInitial());

  List<PetModelDto> _allPets = [];

  Future<void> getPets({String? category}) async {
    emit(HomeLoading());
    final result = await _homeRepository.getPets(category: category);
    if (isClosed) return; // Safety check
    switch (result) {
      case NetworkSuccess<List<PetModelDto>>(data: final pets):
        _allPets = pets ?? [];
        emit(HomeSuccess(_allPets));
      case NetworkError<List<PetModelDto>>(message: final message):
        emit(HomeError(message));
    }
  }

  void searchPets(String query) {
    if (query.isEmpty) {
      emit(HomeSuccess(_allPets));
      return;
    }
    final filteredPets = _allPets.where((pet) {
      final petName = pet.name?.toLowerCase() ?? '';
      final ownerName = pet.user?.fullName?.toLowerCase() ?? '';
      final searchLower = query.toLowerCase();
      return petName.contains(searchLower) || ownerName.contains(searchLower);
    }).toList();
    emit(HomeSuccess(filteredPets));
  }
}
