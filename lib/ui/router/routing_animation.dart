
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class RoutingAnimation {
  // 下から上のアニメーション
  CustomTransitionPage transitionDownToUp(Widget widget){
    return CustomTransitionPage(
      child: widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const Offset begin = Offset(0.0, 1.0); // 下から上
        const Offset end = Offset.zero;
        final Animatable<Offset> tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: Curves.easeInOut));
        final Animation<Offset> offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  // 左から右のアニメーション
  CustomTransitionPage transitionLeftToRight(Widget widget){
    return CustomTransitionPage(
      child: widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const Offset begin = Offset(1.0, 0.0); // 左から右
        const Offset end = Offset.zero;
        final Animatable<Offset> tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: Curves.easeInOut));
        final Animation<Offset> offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}