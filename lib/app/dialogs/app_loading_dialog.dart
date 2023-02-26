import 'package:flutter/material.dart';

import '../base_widgets/base_stateless_widget.dart';
import '../base_widgets/text_base_widgets.dart';

class AppLoadingDialog extends BaseStatelessWidget {
  const AppLoadingDialog({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      key: key,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(22.0),
        decoration: BoxDecoration(
          color: isdarkTheme(context) ? Colors.black : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Row(
          children: [
            ...widgetWithSeprator(
              widget: const CircularProgressIndicator(),
              width: 16,
            ),
            Expanded(
              child: TextBaseWidget(
                text: title ?? 'Loading',
                textSize: 16,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showMainAnimatedDialog(BuildContext context, {Function? dialogHideCallback, bool barrierDismissible = true}) {
  showGeneralDialog(
    barrierDismissible: barrierDismissible,
    barrierLabel: 'Barrier label',
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: const AppLoadingDialog(),
      );
    },
    transitionDuration: const Duration(milliseconds: 100),
  ).then((value) {
    if (dialogHideCallback != null) {
      dialogHideCallback.call();
    }
  });
}

void showMainDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return const AppLoadingDialog();
    },
  );
}
