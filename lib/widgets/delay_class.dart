import 'dart:ui';

class DelayFunction {
  static void delayAfterTime(VoidCallback onTap, [int milliseconds = 500]) {
    Future.delayed(Duration(milliseconds: milliseconds), () {
      onTap();
    });
  }
}
