import 'package:flutter/material.dart';
import 'package:flutter_ksubway/main.dart';
import 'package:flutter_ksubway/style/textStyles.dart';

class SubwayLineButton extends StatelessWidget {
  const SubwayLineButton({
    Key? key,
    required this.animationControllerList,
    required this.lineNumTitles,
    required this.lineNumColors,
    required this.index,
  }) : super(key: key);

  final List<AnimationController> animationControllerList;
  final List<String> lineNumTitles;
  final List<Color> lineNumColors;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1 - animationControllerList[index].value,
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 0, 4, 12),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Center(
              child: Text(lineNumTitles[index], style: textStyleSub1.copyWith(fontSize: 14)),
            ),
          ),
          decoration: BoxDecoration(
            color: MyApp.themeNotifier.value == ThemeMode.light ? Colors.white : lineNumColors[index].withAlpha(40),
            border: Border.all(width: 2, color: lineNumColors[index]),
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: MyApp.themeNotifier.value == ThemeMode.light ? Colors.grey : Colors.black,
                offset: const Offset(0.0, 4.0), //(x,y)
                blurRadius: 4.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
