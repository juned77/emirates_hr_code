import 'package:emihr_code/app/data/models/user_model.dart';

import '../models/data_state.dart';
import '../models/error_model.dart';

abstract class MasterRepository {
  Future<DataState<UserModel, ErrorModel>> getProfileData(String url);
}
