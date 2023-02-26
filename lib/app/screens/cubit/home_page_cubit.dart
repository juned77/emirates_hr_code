import 'package:emihr_code/app/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/repository/master_repository_impl.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({required this.masterRepositoryImpl}) : super(HomePageInitial());

  MasterRepositoryImpl masterRepositoryImpl;
  UserModel? userModel;

  Future<void> getApiData() async {
    // print('getApiData');

    emit(ShowLoding());

    masterRepositoryImpl
        .getProfileData('api/')
        .then((value) {
          // print(value);
          userModel = value.successDataObject;
          emit(HideLoading(userModel: value.successDataObject));
        })
        .onError((error, stackTrace) {
          emit(const HideLoading());
        })
        .whenComplete(() {
          // emit(HideLoadingDashboardState());
          
        });
  }

  String getDate(String x) {
    DateTime y = DateTime.parse(x);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formatted = formatter.format(y);
    return formatted;
  }
}
