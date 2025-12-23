import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/details/data/details_services/details_firebase.dart';
import 'package:pawty/features/details/data/repo/data_source/details_remote_data_source_contract.dart';

class DetailsRemoteDataSourceImp implements DetailsRemoteDataSourceContract {
  DetailsRemoteDataSourceImp(this._detailsFirebase);
  final DetailsFirebase _detailsFirebase;

  @override
  Future<NetworkResult<PetModelDto>> getPetDetails(String id) =>
      _detailsFirebase.getPetDetails(id);
}

DetailsRemoteDataSourceContract detailsRemoteDataSourceInjectable() =>
    DetailsRemoteDataSourceImp(DetailsFirebase.instance);
