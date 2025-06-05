import 'package:xjf_flutter_project/model/banner_model.dart';
import 'package:xjf_flutter_project/request/api.dart';
import 'package:xjf_flutter_project/request/dio_manager.dart';

class ApiService {
  void getBanner(Function callback) async {
    DioManager.singleton.dio
        .get(Api.HOME_BANNER)
        .then((response) {
      callback(BannerModel(response.data));
    });
  }


}