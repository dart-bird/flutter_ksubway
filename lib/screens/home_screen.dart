import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ksubway/config/application.dart';
import 'package:flutter_ksubway/providers/exp_ksubway_provider.dart';
import 'package:flutter_ksubway/providers/kusbway_provider.dart';
import 'package:flutter_ksubway/style/subwayStyles.dart';
import 'package:flutter_ksubway/style/textStyles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchStationTextEditingController = TextEditingController();
    final ksubwayProvider = Provider.of<KsubwayProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '지하철 검색에는',
                            style: textStyleTitle,
                          ),
                          SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                const Text(
                                  'K-SUBWAY',
                                  style: textStyleTitle,
                                ),
                                const SizedBox(width: 8),
                                AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    RotateAnimatedText('오픈소스', textStyle: textStyleTitle),
                                    RotateAnimatedText('좋아 😘', textStyle: textStyleTitle),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        onChanged: (v) {
                          ksubwayProvider.updateStationSuggestions(v);
                        },
                        decoration: InputDecoration(
                          hintText: '입력해주세요',
                          hintStyle: textStyleSub1,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        height: 200.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          color: Color.fromARGB(60, 158, 158, 158),
                        ),
                        child: ksubwayProvider.stationSuggestions.isEmpty
                            ? Center(
                                child: Text(
                                '검색 내용 없음',
                                style: textStyleSub2.copyWith(color: Colors.black38),
                              ))
                            : ListView.builder(
                                itemCount: ksubwayProvider.stationSuggestions.length,
                                itemBuilder: ((context, index) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (ksubwayProvider.stationSuggestions[index].statnNm!.isNotEmpty) {
                                            Application.router.navigateTo(
                                              context,
                                              "/arrinfo/${ksubwayProvider.stationSuggestions[index].statnNm!}",
                                              transition: TransitionType.materialFullScreenDialog,
                                            );
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(18)),
                                            color: lineIdColors[ksubwayProvider.stationSuggestions[index].subwayId!],
                                          ),
                                          padding: const EdgeInsets.all(16),
                                          child: Row(
                                            children: [
                                              Text(
                                                '${lineIdTexts[ksubwayProvider.stationSuggestions[index].subwayId!]}',
                                                style: textStyleSub1,
                                                textAlign: TextAlign.start,
                                              ),
                                              const Spacer(),
                                              Text(
                                                ksubwayProvider.stationSuggestions[index].statnNm!,
                                                style: textStyleSub1,
                                                textAlign: TextAlign.end,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8)
                                    ],
                                  );
                                }),
                              ),
                      ),
                    ],
                  ),
                ),
                CupertinoButton(
                  child: const Text('실험 기능'),
                  onPressed: () {
                    Provider.of<ExpKsubwayProvider>(context, listen: false).updateExpksubwayInfo('1'); //처음 표시를 위해 로딩
                    Application.router.navigateTo(context, "/exp", transition: TransitionType.cupertino);
                  },
                ),
                CupertinoButton(
                  child: const Text('설정'),
                  onPressed: () {
                    Application.router.navigateTo(context, "/setting", transition: TransitionType.cupertino);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
