import 'package:pawty/core/network/network.dart';
import 'package:pawty/features/add_pet/data/model/pet_model_dto.dart';
import 'package:pawty/features/home/data/home_services/home_firebase.dart';
import 'package:pawty/features/home/data/repo/data_source/home_remote_data_source_contract.dart';

class HomeRemoteDataSourceImp implements HomeRemoteDataSourceContract {
  HomeRemoteDataSourceImp(this._homeFirebase);
  final HomeFirebase _homeFirebase;

  @override
  Future<NetworkResult<List<PetModelDto>>> getPets({String? category}) =>
      _homeFirebase.getPets(category: category);
}

// Simple manual injection for now if DI setup isn't fully automated with get_it/injectable generated code yet
HomeRemoteDataSourceContract homeRemoteDataSourceInjectable() =>
    HomeRemoteDataSourceImp(HomeFirebase.instance);
