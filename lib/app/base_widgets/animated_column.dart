import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

enum _AnimatedColumnMode { toStaggeredList, synchronized }

class AnimatedColumn extends StatelessWidget {
  /// Configure the children's animation to be synchronized (all the children's animation start at the same time).
  ///
  /// Default value for [duration] is 375ms.
  ///
  /// The [child] argument must not be null.
  const AnimatedColumn.synchronized({
    Key? key,
    this.children = const [],
    this.inScollView = false,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
  })  : _animatedColumnMode = _AnimatedColumnMode.synchronized,
        super(key: key);

  /// It corresponds to the children you would normally have passed to the [Column] .
  const AnimatedColumn.toStaggeredList({
    Key? key,
    this.children = const [],
    this.inScollView = false,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
  })  : _animatedColumnMode = _AnimatedColumnMode.toStaggeredList,
        super(key: key);

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final bool inScollView;
  final MainAxisAlignment mainAxisAlignment;

  final _AnimatedColumnMode _animatedColumnMode;

  Column getColumn({required List<Widget> children}) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    late Widget animatedColumnWidget;
    if (_animatedColumnMode == _AnimatedColumnMode.synchronized) {
      animatedColumnWidget = AnimationConfiguration.synchronized(
        duration: const Duration(milliseconds: 375),
        child: SlideAnimation(
          duration: const Duration(milliseconds: 375),
          horizontalOffset: 0,
          verticalOffset: -100,
          child: FadeInAnimation(
            duration: const Duration(milliseconds: 500),
            child: getColumn(children: children),
          ),
        ),
      );
    } else if (_animatedColumnMode == _AnimatedColumnMode.toStaggeredList) {
      animatedColumnWidget = getColumn(
        children: AnimationConfiguration.toStaggeredList(
          childAnimationBuilder: (widget) {
            return SlideAnimation(
              duration: const Duration(milliseconds: 100),
              horizontalOffset: 0,
              verticalOffset: -100,
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 150),
                child: widget,
              ),
            );
          },
          children: children,
        ),
      );
    }

    if (inScollView) {
      return AnimationLimiter(child: animatedColumnWidget);
    } else {
      return animatedColumnWidget;
    }
  }
}
