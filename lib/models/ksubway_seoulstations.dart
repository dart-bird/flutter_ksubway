class KsubwaySeoulstations {
  List<StationList>? stationList;

  KsubwaySeoulstations({this.stationList});

  KsubwaySeoulstations.fromJson(Map<String, dynamic> json) {
    if (json['stationList'] != null) {
      stationList = <StationList>[];
      json['stationList'].forEach((v) {
        stationList!.add(StationList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stationList != null) {
      data['stationList'] = stationList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StationList {
  int? subwayId;
  int? statnId;
  String? statnNm;

  StationList({this.subwayId, this.statnId, this.statnNm});

  StationList.fromJson(Map<String, dynamic> json) {
    subwayId = int.parse(json['SUBWAY_ID'].toString().split(".")[0]);
    statnId = int.parse(json['STATN_ID'].toString().split(".")[0]);
    statnNm = json['STATN_NM'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SUBWAY_ID'] = subwayId;
    data['STATN_ID'] = statnId;
    data['STATN_NM'] = statnNm;
    return data;
  }
}
