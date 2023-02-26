part of 'home_page_cubit.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {}

class ShowLoding extends HomePageState {}

class HideLoading extends HomePageState {
  final UserModel? userModel;

  const HideLoading({this.userModel});
}
