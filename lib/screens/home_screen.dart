import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ksubway/config/application.dart';
import 'package:flutter_ksubway/main.dart';
import 'package:flutter_ksubway/models/ksubway_seoulstations.dart';
import 'package:flutter_ksubway/preferences/ksubway_stations_preference.dart';
import 'package:flutter_ksubway/services/ksubway_api.dart';
import 'package:flutter_ksubway/style/textStyles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StationList> stationSuggestions = [];
  KsubwaySeoulstations ksubwaySeoulstations = KsubwaySeoulstations(stationList: []);
  final List<String?> seoulstations = [];
  final TextEditingController _searchStationTextEditingController = TextEditingController();
  final KsubwayStationsPreference _ksubwayStationsPreference = KsubwayStationsPreference();
  void fetchKsubwayStations() async {
    ksubwaySeoulstations = await KsubwayApi.fetchKsubwayStations(city: 'seoul');
    _ksubwayStationsPreference.setSeoulstations(ksubwaySeoulstations);
    ksubwaySeoulstations = await _ksubwayStationsPreference.getSeoulstations();
    for (var i = 0; i < ksubwaySeoulstations.stationList!.length; i++) {
      if (ksubwaySeoulstations.stationList![i].statnNm == null || ksubwaySeoulstations.stationList![i].statnNm == "null") continue;
      seoulstations.add(ksubwaySeoulstations.stationList![i].statnNm);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchKsubwayStations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
                      controller: _searchStationTextEditingController,
                      keyboardType: TextInputType.text,
                      onChanged: (v) async {
                        stationSuggestions.clear();
                        for (var i = 0; i < ksubwaySeoulstations.stationList!.length; i++) {
                          String expValue = '';
                          v.isEmpty ? expValue = '' : expValue = '?' + v;
                          RegExp exp = RegExp(r'()' + expValue);
                          if (exp.hasMatch(ksubwaySeoulstations.stationList![i].statnNm!) && v.isEmpty == false) {
                            stationSuggestions.add(ksubwaySeoulstations.stationList![i]);
                          }
                        }
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                          onPressed: () {
                            Application.router.navigateTo(
                              context,
                              "/arrinfo/${_searchStationTextEditingController.text}",
                              transition: TransitionType.materialFullScreenDialog,
                            );
                          },
                        ),
                        hintText: '서울',
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
                      child: stationSuggestions.isEmpty
                          ? Center(
                              child: Text(
                              '검색 내용 없음',
                              style: textStyleSub2.copyWith(color: Colors.black38),
                            ))
                          : ListView.builder(
                              itemCount: stationSuggestions.length,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: () => _searchStationTextEditingController.text = stationSuggestions[index].statnNm!,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#${stationSuggestions[index].subwayId!.toString()}',
                                          style: textStyleSub1,
                                          textAlign: TextAlign.start,
                                        ),
                                        const Spacer(),
                                        Text(
                                          stationSuggestions[index].statnNm!,
                                          style: textStyleSub1,
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              CupertinoButton(
                child: const Text('실험 기능'),
                onPressed: () {
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
    );
  }
}
