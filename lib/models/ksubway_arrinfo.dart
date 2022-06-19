class KsubwayArrinfo {
  ErrorMessage? errorMessage;
  List<RealtimeArrivalList>? realtimeArrivalList;

  KsubwayArrinfo({this.errorMessage, this.realtimeArrivalList});

  KsubwayArrinfo.fromJson(Map<String, dynamic> json) {
    errorMessage = json['errorMessage'] != null ? ErrorMessage.fromJson(json['errorMessage']) : null;
    if (json['realtimeArrivalList'] != null) {
      realtimeArrivalList = <RealtimeArrivalList>[];
      json['realtimeArrivalList'].forEach((v) {
        realtimeArrivalList!.add(RealtimeArrivalList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.errorMessage != null) {
      data['errorMessage'] = this.errorMessage!.toJson();
    }
    if (this.realtimeArrivalList != null) {
      data['realtimeArrivalList'] = this.realtimeArrivalList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ErrorMessage {
  String? status;
  String? code;
  String? message;
  String? link;
  String? developerMessage;
  String? total;

  ErrorMessage({this.status, this.code, this.message, this.link, this.developerMessage, this.total});

  ErrorMessage.fromJson(Map<String, dynamic> json) {
    status = json['status'].toString();
    code = json['code'].toString();
    message = json['message'].toString();
    link = json['link'].toString();
    developerMessage = json['developerMessage'].toString();
    total = json['total'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    data['link'] = this.link;
    data['developerMessage'] = this.developerMessage;
    data['total'] = this.total;
    return data;
  }
}

class RealtimeArrivalList {
  String? beginRow;
  String? endRow;
  String? curPage;
  String? pageRow;
  String? totalCount;
  String? rowNum;
  String? selectedCount;
  String? subwayId;
  String? subwayNm;
  String? updnLine;
  String? trainLineNm;
  String? subwayHeading;
  String? statnFid;
  String? statnTid;
  String? statnId;
  String? statnNm;
  String? trainCo;
  String? ordkey;
  String? subwayList;
  String? statnList;
  String? btrainSttus;
  String? barvlDt;
  String? btrainNo;
  String? bstatnId;
  String? bstatnNm;
  String? recptnDt;
  String? arvlMsg2;
  String? arvlMsg3;
  String? arvlCd;

  RealtimeArrivalList({this.beginRow, this.endRow, this.curPage, this.pageRow, this.totalCount, this.rowNum, this.selectedCount, this.subwayId, this.subwayNm, this.updnLine, this.trainLineNm, this.subwayHeading, this.statnFid, this.statnTid, this.statnId, this.statnNm, this.trainCo, this.ordkey, this.subwayList, this.statnList, this.btrainSttus, this.barvlDt, this.btrainNo, this.bstatnId, this.bstatnNm, this.recptnDt, this.arvlMsg2, this.arvlMsg3, this.arvlCd});

  RealtimeArrivalList.fromJson(Map<String, dynamic> json) {
    beginRow = json['beginRow'].toString();
    endRow = json['endRow'].toString();
    curPage = json['curPage'].toString();
    pageRow = json['pageRow'].toString();
    totalCount = json['totalCount'].toString();
    rowNum = json['rowNum'].toString();
    selectedCount = json['selectedCount'].toString();
    subwayId = json['subwayId'].toString();
    subwayNm = json['subwayNm'].toString();
    updnLine = json['updnLine'].toString();
    trainLineNm = json['trainLineNm'].toString();
    subwayHeading = json['subwayHeading'].toString();
    statnFid = json['statnFid'].toString();
    statnTid = json['statnTid'].toString();
    statnId = json['statnId'].toString();
    statnNm = json['statnNm'].toString();
    trainCo = json['trainCo'].toString();
    ordkey = json['ordkey'].toString();
    subwayList = json['subwayList'].toString();
    statnList = json['statnList'].toString();
    btrainSttus = json['btrainSttus'].toString();
    barvlDt = json['barvlDt'].toString();
    btrainNo = json['btrainNo'].toString();
    bstatnId = json['bstatnId'].toString();
    bstatnNm = json['bstatnNm'].toString();
    recptnDt = json['recptnDt'].toString();
    arvlMsg2 = json['arvlMsg2'].toString();
    arvlMsg3 = json['arvlMsg3'].toString();
    arvlCd = json['arvlCd'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beginRow'] = this.beginRow;
    data['endRow'] = this.endRow;
    data['curPage'] = this.curPage;
    data['pageRow'] = this.pageRow;
    data['totalCount'] = this.totalCount;
    data['rowNum'] = this.rowNum;
    data['selectedCount'] = this.selectedCount;
    data['subwayId'] = this.subwayId;
    data['subwayNm'] = this.subwayNm;
    data['updnLine'] = this.updnLine;
    data['trainLineNm'] = this.trainLineNm;
    data['subwayHeading'] = this.subwayHeading;
    data['statnFid'] = this.statnFid;
    data['statnTid'] = this.statnTid;
    data['statnId'] = this.statnId;
    data['statnNm'] = this.statnNm;
    data['trainCo'] = this.trainCo;
    data['ordkey'] = this.ordkey;
    data['subwayList'] = this.subwayList;
    data['statnList'] = this.statnList;
    data['btrainSttus'] = this.btrainSttus;
    data['barvlDt'] = this.barvlDt;
    data['btrainNo'] = this.btrainNo;
    data['bstatnId'] = this.bstatnId;
    data['bstatnNm'] = this.bstatnNm;
    data['recptnDt'] = this.recptnDt;
    data['arvlMsg2'] = this.arvlMsg2;
    data['arvlMsg3'] = this.arvlMsg3;
    data['arvlCd'] = this.arvlCd;
    return data;
  }
}
