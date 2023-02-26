import 'package:emihr_code/app/data/models/user_model.dart';
import 'package:emihr_code/app/utils/app_colors.dart';
import 'package:emihr_code/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../base_widgets/animated_column.dart';
import '../base_widgets/text_base_widgets.dart';
import '../data/repository/master_repository_impl.dart';
import 'cubit/home_page_cubit.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late HomePageCubit homePageCubit;

  @override
  void initState() {
    homePageCubit = HomePageCubit(masterRepositoryImpl: context.read<MasterRepositoryImpl>());
    homePageCubit.getApiData();

    super.initState();
  }

  AppLocalizations getString(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  Widget getFeild(String title, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextBaseWidget(
          text: '$title - ',
          textColor: Colors.blueGrey,
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.5)),
          child: Text(
            data,
            maxLines: 4,
          ),
        ),
      ],
    );
  }

  String getName(UserModel userModel) {
    try {
      return '${userModel.results?.first.name?.first} ${userModel.results?.first.name?.last}';
    } catch (e) {
      return 'dummy';
    }
  }

  String getAddress(UserModel userModel) {
    try {
      return '${userModel.results?.first.location?.street?.number} ${userModel.results?.first.location?.street?.name}, ${userModel.results?.first.location?.city} ${userModel.results?.first.location?.state} ${userModel.results?.first.location?.country}';
    } catch (e) {
      return 'dummy address';
    }
  }

  Card mainUi(UserModel userModel, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AnimatedColumn.synchronized(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              getProfileViewLayout(userModel, context),
              const SizedBox(height: 20),
              ...widgetWithSeprator(
                widget: getFeild(getString(context).email, userModel.results?.first.email ?? ''),
                height: 20,
              ),
              ...widgetWithSeprator(
                widget: getFeild(
                  getString(context).password,
                  userModel.results?.first.login?.password ?? '',
                ),
                height: 20,
              ),
              ...widgetWithSeprator(
                widget: getFeild(
                  getString(context).dob,
                  homePageCubit.getDate(userModel.results?.first.dob?.date ?? ''),
                ),
                height: 20,
              ),
              ...widgetWithSeprator(
                widget: getFeild(
                  getString(context).gender,
                  userModel.results?.first.gender ?? '',
                ),
                height: 20,
              ),
              ...widgetWithSeprator(
                widget: getFeild(
                  getString(context).phoneNo,
                  userModel.results?.first.phone ?? '',
                ),
                height: 20,
              ),
              ...widgetWithSeprator(
                widget: getFeild(
                  getString(context).address,
                  getAddress(userModel),
                ),
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row getProfileViewLayout(UserModel userModel, BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 70,
            ),
            Positioned(
              right: 0,
              top: 10,
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(60),
                  child: Image.network(userModel.results?.first.picture?.large ?? '', fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBaseWidget(
                text: getName(userModel),
                // text: 'asjhd lajshd jkaslkda',
                textSize: 22,
                textColor: AppColors.primaryColor,
              ),
              TextBaseWidget(
                text:
                    '${getString(context).registeredOn} - ${homePageCubit.getDate(userModel.results?.first.registered?.date ?? '')}',
                textSize: 14,
                textColor: Colors.green,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextBaseWidget(
          text: getString(context).profile,
          textSize: 18,
        ),
        actions: [
          IconButton(
            onPressed: () {
              homePageCubit.getApiData();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        bloc: homePageCubit,
        builder: (context, state) {
          if (state is ShowLoding) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HideLoading && state.userModel != null) {
            return mainUi(state.userModel!, context);
          } else {
            return kShrinkedBox;
          }
        },
      ),
    );
  }
}
