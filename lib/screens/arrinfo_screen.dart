import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ksubway/models/ksubway_arrinfo.dart';
import 'package:flutter_ksubway/services/ksubway_api.dart';

class ArrInfoScreen extends StatefulWidget {
  final stationName;
  const ArrInfoScreen(this.stationName, {Key? key}) : super(key: key);

  @override
  State<ArrInfoScreen> createState() => _ArrInfoScreenState();
}

class _ArrInfoScreenState extends State<ArrInfoScreen> {
  KsubwayArrinfo _ksubwayArrinfo = KsubwayArrinfo();
  List<RealtimeArrivalList> realtimeArrivalList = [];
  void fetchAll() async {
    _ksubwayArrinfo = await KsubwayApi.fetchKsubwayArrinfo(
      startPage: "0",
      endPage: "50",
      realtimeType: "realtimeStationArrival",
      stationName: widget.stationName,
    );

    realtimeArrivalList = _ksubwayArrinfo.realtimeArrivalList ?? [];
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CupertinoNavigationBar(),
            Expanded(
              child: ListView.builder(
                itemCount: realtimeArrivalList.length,
                itemBuilder: (context, index) {
                  return Text(realtimeArrivalList[index].statnNm!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
