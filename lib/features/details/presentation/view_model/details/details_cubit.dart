import 'package:bloc/bloc.dart';
import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/details/data/repo/repository/details_repository_contract.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final DetailsRepositoryContract _detailsRepository;

  DetailsCubit(this._detailsRepository) : super(DetailsInitial());

  Future<void> getPetDetails(String id) async {
    emit(DetailsLoading());
    final result = await _detailsRepository.getPetDetails(id);
    if (isClosed) return;
    switch (result) {
      case NetworkSuccess<PetModelDto>(data: final pet):
        if (pet != null) {
          emit(DetailsSuccess(pet));
        } else {
          emit(DetailsError("Pet not found"));
        }
      case NetworkError<PetModelDto>(message: final message):
        emit(DetailsError(message));
    }
  }
}
