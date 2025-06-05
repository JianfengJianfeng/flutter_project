import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:xjf_flutter_project/model/banner_model.dart';
import 'package:xjf_flutter_project/request/api_service.dart';
import 'package:xjf_flutter_project/ui/web/webview_page.dart';

class BannerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BannerWidgetState();
  }
}

class BannerWidgetState extends State<BannerWidget> {

  List<BannerData> _bannerList = [];

  @override
  void initState() {
    _getBanner();
  }
  Future<void> _getBanner() async {
    try {
      ApiService().getBanner((BannerModel _bannerModel) {
        if (_bannerModel.data.isNotEmpty) {
          setState(() {
            _bannerList = _bannerModel.data;
          });
        }
      });
    } catch (e) {
      // 处理错误，例如显示错误提示
      debugPrint('获取Banner失败: $e');
    }
  }

  Widget buildItemImageWidget(BuildContext context, int index) {
    return new InkWell(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context){
          return new WebViewPage(title: _bannerList[index].title,url: _bannerList[index].url);
        }));
      },
      child: new Container(
        width: double.infinity,
        child: new Image.network(
          _bannerList[index].imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // 设置固定高度
      child: _bannerList.isEmpty 
        ? Center(child: CircularProgressIndicator()) // 添加加载指示器
        : Swiper(
            itemBuilder: (BuildContext context, int index) {
              if (_bannerList[index] == null ||
                  _bannerList[index].imagePath == null) {
                return new Container(
                  color: Colors.grey[100],
                );
              } else {
                return buildItemImageWidget(context, index);
              }
            },
            itemCount: _bannerList.length,
            autoplay: true,
            pagination: new SwiperPagination(),
          ),
    );
  }
}