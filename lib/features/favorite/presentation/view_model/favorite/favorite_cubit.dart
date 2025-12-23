import 'package:bloc/bloc.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/favorite/data/repo/repository/favorite_repository_contract.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepositoryContract _favoriteRepository;

  FavoriteCubit(this._favoriteRepository) : super(FavoriteInitial());

  List<PetModelDto> favorites = [];

  Future<void> getFavorites() async {
    emit(FavoriteLoading());
    final result = await _favoriteRepository.getFavorites();
    if (isClosed) return;
    switch (result) {
      case NetworkSuccess<List<PetModelDto>>(data: final favs):
        favorites = favs ?? [];
        emit(FavoriteSuccess(favorites));
      case NetworkError<List<PetModelDto>>(message: final message):
        emit(FavoriteError(message));
    }
  }

  bool isFavorite(String? petId) {
    if (petId == null) return false;
    return favorites.any((element) => element.id == petId);
  }

  Future<void> toggleFavorite(PetModelDto pet) async {
    if (pet.id == null) return;
    final isFav = isFavorite(pet.id);
    if (isFav) {
      favorites.removeWhere((element) => element.id == pet.id);
      emit(FavoriteSuccess(List.from(favorites))); 
      await _favoriteRepository.removeFavorite(pet.id!);
    } else {
      favorites.add(pet);
      emit(FavoriteSuccess(List.from(favorites))); 
      await _favoriteRepository.addFavorite(pet);
    }
  }
}
