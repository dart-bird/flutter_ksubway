class ExpksubwayInfo {
  bool? isValid;
  List<TtcVOList>? ttcVOList;
  bool? isDemo;

  ExpksubwayInfo({this.isValid, this.ttcVOList, this.isDemo});

  ExpksubwayInfo.fromJson(Map<String, dynamic> json) {
    isValid = json['isValid'];
    if (json['ttcVOList'] != null) {
      ttcVOList = <TtcVOList>[];
      json['ttcVOList'].forEach((v) {
        ttcVOList!.add(TtcVOList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isValid'] = this.isValid;
    if (this.ttcVOList != null) {
      data['ttcVOList'] = this.ttcVOList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TtcVOList {
  String? trainY;
  String? trainP;
  String? sts;
  String? dir;
  String? line;
  String? stationCd;
  String? stationNm;
  String? statnTnm;
  String? directAt;
  String? lineGbn;

  TtcVOList({this.trainY, this.trainP, this.sts, this.dir, this.line, this.stationCd, this.stationNm, this.statnTnm, this.directAt, this.lineGbn});

  TtcVOList.fromJson(Map<String, dynamic> json) {
    trainY = json['trainY'].toString();
    trainP = json['trainP'].toString();
    sts = json['sts'].toString();
    dir = json['dir'].toString();
    line = json['line'].toString();
    stationCd = json['stationCd'].toString();
    stationNm = json['stationNm'].toString();
    statnTnm = json['statnTnm'].toString();
    directAt = json['directAt'].toString();
    lineGbn = json['lineGbn'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trainY'] = this.trainY;
    data['trainP'] = this.trainP;
    data['sts'] = this.sts;
    data['dir'] = this.dir;
    data['line'] = this.line;
    data['stationCd'] = this.stationCd;
    data['stationNm'] = this.stationNm;
    data['statnTnm'] = this.statnTnm;
    data['directAt'] = this.directAt;
    data['lineGbn'] = this.lineGbn;
    return data;
  }
}
