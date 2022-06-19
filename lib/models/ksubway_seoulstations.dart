class KsubwaySeoulstations {
  List<StationList>? stationList;

  KsubwaySeoulstations({this.stationList});

  KsubwaySeoulstations.fromJson(Map<String, dynamic> json) {
    if (json['stationList'] != null) {
      stationList = <StationList>[];
      json['stationList'].forEach((v) {
        stationList!.add(new StationList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stationList != null) {
      data['stationList'] = this.stationList!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SUBWAY_ID'] = this.subwayId;
    data['STATN_ID'] = this.statnId;
    data['STATN_NM'] = this.statnNm;
    return data;
  }
}
