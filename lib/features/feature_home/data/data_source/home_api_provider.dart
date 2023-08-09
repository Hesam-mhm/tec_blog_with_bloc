
import 'package:dio/dio.dart';
import 'package:tec_blog_with_bloc/common/utils/url_constants.dart';

class HomeApiProvider {
  Dio dio = Dio();

  Future<dynamic> getHomeItmes() async {
    
      Response response = await dio.get(UrlConstants.getHomeItems);
      return response ;    
  }
}
