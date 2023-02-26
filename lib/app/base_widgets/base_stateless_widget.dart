import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../mixins/navigator_mixin.dart';
import '../mixins/progress_mixin.dart';
import '../mixins/ui_util_mixin.dart';

abstract class BaseStatelessWidget extends StatelessWidget with LoadingMixin, NavigatorMixin, UiUtilMixin {
  const BaseStatelessWidget({Key? key}) : super(key: key);

  List<Widget> widgetWithSeprator({
    required Widget widget,
    bool visible = true,
    double? height,
    double? width,
  }) {
    return visible
        ? [
            widget,
            SizedBox(height: height, width: width),
          ]
        : [];
  }

  bool isdarkTheme(BuildContext context) {
    // return context.read<MainAppCubit>().themeMode == ThemeMode.dark;
    return false;
  }

  AppLocalizations getString(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  T readProvider<T>(BuildContext context, T cubit) {
    return context.read<T>();
  }
}
