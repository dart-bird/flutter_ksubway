import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ksubway/components/app_title.dart';
import 'package:flutter_ksubway/components/subway_info.dart';
import 'package:flutter_ksubway/components/subway_line_button.dart';
import 'package:flutter_ksubway/providers/exp_ksubway_provider.dart';
import 'package:flutter_ksubway/style/subwayStyles.dart';
import 'package:provider/provider.dart';

class ExpScreen extends StatelessWidget {
  const ExpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subwayInfoScrollController = ScrollController();
    final subwayLineScrollController = ScrollController();
    final expKsubwayProvider = Provider.of<ExpKsubwayProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CupertinoNavigationBar(
              middle: AppTitle(title: 'K - SUBWAY Fighter'),
              previousPageTitle: 'back',
            ),
            const SizedBox(height: 8),
            SizedBox(
              child: Text(
                expKsubwayProvider.isPlayDemo == true ? 'DEMO (API ENDPOINT NEED)' : 'REAL DATA ( ${expKsubwayProvider.expksubwayApiUrl} )',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 8),
            // -- content
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: ListView.builder(
                      controller: subwayLineScrollController,
                      itemCount: expKsubwayProvider.lineNumCdList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SubwayLineButton(
                          lineNumTitles: expKsubwayProvider.lineNumTitles,
                          lineNumColors: lineNumColors,
                          index: index,
                          onTap: () {
                            expKsubwayProvider.lineNumPageIndex = index;
                            expKsubwayProvider.updateExpksubwayInfo(expKsubwayProvider.lineNumCdList[index]);
                          },
                        );
                      },
                    ),
                  ),
                  SubwayInfo(
                    subwayInfoScrollController: subwayInfoScrollController,
                    ttcVOList: expKsubwayProvider.ttcVOList,
                    lineNumColors: lineNumColors,
                    lineNumPageIndex: expKsubwayProvider.lineNumPageIndex,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DemoPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintBlack = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final paintYellow = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    final step = size.width / 20;

    for (int i = 0; i < size.width; i++) {
      final p1 = Offset(step * i, 0);
      final p2 = Offset(step * (i + 1), 0);
      final p3 = Offset(step * (i + 2), size.height);
      final p4 = Offset(step * (i + 1), size.height);

      final path = Path()
        ..moveTo(p1.dx, p1.dy)
        ..lineTo(p2.dx, p2.dy)
        ..lineTo(p3.dx, p3.dy)
        ..lineTo(p4.dx, p4.dy)
        ..close();

      canvas.drawPath(path, i % 2 == 0 ? paintYellow : paintBlack);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
