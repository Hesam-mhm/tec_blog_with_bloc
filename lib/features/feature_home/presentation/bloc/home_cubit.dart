import 'package:bloc/bloc.dart';
import 'package:tec_blog_with_bloc/features/feature_home/repository/home_repository.dart';

import '../../../../common/resourse/data_state.dart';
import '../../data/models/home_model.dart';

part 'home_state.dart';
part 'home_status.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository = HomeRepository();
  HomeCubit() : super(HomeState(homeStatus: HomeLoading()));

  Future<void> getHomeItems() async {
    emit(state.copyWith(newHomeStatus: HomeLoading()));
    DataState dataState = await homeRepository.fetchHomeItems();
    if (dataState is DataSuccess) {
      emit(state.copyWith(
          newHomeStatus: HomeCompleted(homeModel: dataState.data)));
    }
    if (dataState is DataFailed) {
      emit(state.copyWith(newHomeStatus: HomeError(message: dataState.message!)));
    }
  }
}
