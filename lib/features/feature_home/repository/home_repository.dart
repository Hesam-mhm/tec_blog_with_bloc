import 'package:dio/dio.dart';
import 'package:tec_blog_with_bloc/common/resourse/data_state.dart';
import 'package:tec_blog_with_bloc/features/feature_home/data/data_source/home_api_provider.dart';
import 'package:tec_blog_with_bloc/features/feature_home/data/models/home_model.dart';

class HomeRepository {
  HomeApiProvider apiProvider = HomeApiProvider();
  Future<DataState<HomeModel>> fetchHomeItems() async {
    try {
      Response response = await apiProvider.getHomeItmes();
      if(response.statusCode==200){
      HomeModel homeModel = HomeModel.fromJson(response.data);
      return DataSuccess(homeModel);
      }else{
      return  DataFailed("something went Wrong");
      }

    }catch(e){ 
      return DataFailed("please check Your Connection");
  }
}
}