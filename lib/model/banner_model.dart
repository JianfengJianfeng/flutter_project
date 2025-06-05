import 'dart:convert' show json;

class BannerModel {

  int errorCode;
  String errorMsg;
  List<BannerData> data;

  BannerModel.fromParams({
    this.errorCode = 0,
    this.errorMsg = '',
    this.data = const [],
  });

  factory BannerModel(dynamic jsonStr) {
    if (jsonStr == null) {
      return BannerModel.fromParams();
    }
    if (jsonStr is String) {
      try {
        return BannerModel.fromJson(json.decode(jsonStr));
      } catch (e) {
        return BannerModel.fromParams();
      }
    }
    return BannerModel.fromJson(jsonStr);
  }

  BannerModel.fromJson(Map<String, dynamic> jsonRes)
      : errorCode = jsonRes['errorCode'] as int? ?? 0,
        errorMsg = jsonRes['errorMsg'] as String? ?? '',
        data = (jsonRes['data'] as List<dynamic>?)
            ?.map((item) => BannerData.fromJson(item))
            .toList() ??
            [];

  @override
  String toString() {
    return '{"errorCode": $errorCode, "errorMsg": ${json.encode(errorMsg)}, "data": ${json.encode(data.map((e) => e.toString()).toList())}}';
  }
}

class BannerData {

  int id = 0;
  int isVisible = 0;
  int order = 0;
  int type = 0;
  String desc = '';
  String imagePath = '';
  String title = '';
  String url = '';

  BannerData.fromParams({this.id = 0, this.isVisible = 0, this.order = 0, this.type = 0, this.desc = '', this.imagePath = '', this.title = '', this.url = ''});

  BannerData.fromJson(jsonRes) {
    id = jsonRes['id'];
    isVisible = jsonRes['isVisible'];
    order = jsonRes['order'];
    type = jsonRes['type'];
    desc = jsonRes['desc'];
    imagePath = jsonRes['imagePath'];
    title = jsonRes['title'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"id": $id,"isVisible": $isVisible,"order": $order,"type": $type,"desc": ${desc != null?'${json.encode(desc)}':'null'},"imagePath": ${imagePath != null?'${json.encode(imagePath)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}