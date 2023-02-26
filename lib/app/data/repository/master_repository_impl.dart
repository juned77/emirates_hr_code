import 'package:emihr_code/app/data/models/user_model.dart';

import 'package:emihr_code/app/data/models/data_state.dart';

import '../models/error_model.dart';
import '../remote/remote_service.dart';
import 'master_repository.dart';

class MasterRepositoryImpl implements MasterRepository {
  final RemoteService _remoteService = RemoteService();
  @override
  Future<DataState<UserModel, ErrorModel>> getProfileData(String url) async {
    DataState<UserModel, ErrorModel> response = await _remoteService.callApi<UserModel, ErrorModel>(
      url,
      (json) => UserModel.fromJson(json),
      baseUrl: 'https://randomuser.me/',
      apiTypes: ApiTypes.getApi,
    );
    // kPregnantPagesList,

    if (response.successDataObject is UserModel) {
      return response;
    } else if (response is DataFailed) {
      return Future.error(response.errorDataObject ?? response.errorMessage ?? '');
    } else {
      throw UnimplementedError();
    }
  }
}
