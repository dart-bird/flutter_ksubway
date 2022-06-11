import 'package:flutter/material.dart';
import 'package:flutter_ksubway/style/textStyles.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: textStyleTitle,
      ),
    );
  }
}
