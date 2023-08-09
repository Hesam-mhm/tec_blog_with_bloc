
part of'splash_cubit.dart';

class SplashState{
  ConnectionStatus? splashStatus ;
  SplashState({required this.splashStatus});

  SplashState copyWith({ConnectionStatus? newSplashStatus}){
    return SplashState(splashStatus: newSplashStatus?? splashStatus);
  }
}