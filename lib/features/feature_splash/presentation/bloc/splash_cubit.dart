import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec_blog_with_bloc/features/feature_splash/repository/splash_repository.dart';

part 'splash_state.dart';
part 'splash_status.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashRepository splashRepository = SplashRepository();
  SplashCubit() : super(SplashState(splashStatus: ConnectionInitial()));

  checkConnectivity() async {
    emit(state.copyWith(newSplashStatus: ConnectionInitial()));
    final bool isConnect = await splashRepository.checkConnection();
    if (isConnect) {
      emit(state.copyWith(newSplashStatus: ConnectionOn()));
    } else {
      emit(state.copyWith(newSplashStatus: ConnectionOff()));
    }
  }
}
