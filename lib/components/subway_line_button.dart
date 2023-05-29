import 'package:flutter/material.dart';
import 'package:flutter_ksubway/main.dart';
import 'package:flutter_ksubway/style/textStyles.dart';

class SubwayLineButton extends StatelessWidget {
  const SubwayLineButton({Key? key, required this.lineNumTitles, required this.lineNumColors, required this.index, this.onTap}) : super(key: key);

  final List<String> lineNumTitles;
  final List<Color> lineNumColors;
  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 4, 12),
      decoration: BoxDecoration(
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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: lineNumColors[index].withAlpha(60),
          borderRadius: BorderRadius.circular(16.0),
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              color: MyApp.themeNotifier.value == ThemeMode.light ? Colors.white : lineNumColors[index].withAlpha(40),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Center(
                child: Text(lineNumTitles[index], style: textStyleSub1.copyWith(fontSize: 14)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
