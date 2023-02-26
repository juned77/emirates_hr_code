import 'package:flutter/material.dart';

import '../dialogs/app_loading_dialog.dart';
import 'navigator_mixin.dart';

mixin LoadingMixin implements NavigatorMixin {
  void showLoadingDialog(BuildContext context, {bool barrierDismissible = true}) {
    showMainAnimatedDialog(context, barrierDismissible: barrierDismissible);
  }

  void hideLoadingDialog(BuildContext context) {
    // context.read<BaseAppCubit>().setLoading(isLoading: false);

    popScreen();
  }
}
