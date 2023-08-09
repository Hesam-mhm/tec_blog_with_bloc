import 'package:dio/dio.dart';
import 'package:tec_blog_with_bloc/common/utils/url_constants.dart';

class ArticleApiProvider{
 Dio dio = Dio();

Future<dynamic> getHotestArticleList()async{
  var response =await dio.get("https://techblog.sasansafari.com/Techblog/api/article/get.php?command=new&user_id=1");
  return response ;
}

  
}