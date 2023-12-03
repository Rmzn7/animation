import 'package:animation/controller/home_state.dart';
import 'package:animation/utilities/slider_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(const HomeState());

    void onTempChanged(double value){
      emit(state.copyWith(temperature: value, sliderProgressValue: normalize(value, kMinDegree, kMaxDegree) ));
      return;
    }

    void changeSpeed(int value){
      emit(state.copyWith(speed: value));
      return;
    }
} 