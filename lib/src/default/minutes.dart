part of 'default.dart';

class MinutesDigit extends BaseDigits {
  const MinutesDigit({
    Key? key,
    required Duration duration,
    required ValueNotifier<int> firstDigit,
    required ValueNotifier<int> secondDigit,
    required TextStyle textStyle,
    required int initValue,
    required SlideDirection slideDirection,
    required bool showZeroValue,
    required Curve curve,
    required bool countUp,
    required Duration slideAnimationDuration,
    required SeparatorType separatorType,
    required DurationTitle durationTitle,
    EdgeInsets? separatorPadding,
    String? separator,
    TextDirection? textDirection,
  }) : super(
          key: key,
          duration: duration,
          firstDigit: firstDigit,
          secondDigit: secondDigit,
          textStyle: textStyle,
          initValue: initValue,
          slideDirection: slideDirection,
          showZeroValue: showZeroValue,
          curve: curve,
          countUp: countUp,
          slideAnimationDuration: slideAnimationDuration,
          separatorType: separatorType,
          durationTitle: durationTitle,
          separatorPadding: separatorPadding,
          separator: separator,
          textDirection: textDirection,
        );

  @override
  Widget build(BuildContext context) {
    if (duration.inMinutes < 1 && !showZeroValue) {
      return const SizedBox.shrink();
    }
    final firstDigit = TextAnimation(
      slideAnimationDuration: slideAnimationDuration,
      value: this.firstDigit,
      textStyle: textStyle,
      slideDirection: slideDirection,
      curve: curve,
      countUp: countUp,
      showZeroValue: showZeroValue,
    );

    final secondDigit = TextAnimation(
      slideAnimationDuration: slideAnimationDuration,
      value: this.secondDigit,
      textStyle: textStyle,
      slideDirection: slideDirection,
      curve: curve,
      countUp: countUp,
      showZeroValue: showZeroValue,
    );

    final separator = Padding(
      padding: separatorPadding ?? EdgeInsets.zero,
      child: Visibility(
        visible: separatorType == SeparatorType.symbol,
        child: Text(this.separator ?? ':', style: textStyle),
        replacement: Text(durationTitle.minutes, style: textStyle),
      ),
    );

    List<Widget> children =
        textDirection != null && textDirection == TextDirection.rtl
            ? [
                separator,
                secondDigit,
                firstDigit,
              ]
            : [
                firstDigit,
                secondDigit,
                separator,
              ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
