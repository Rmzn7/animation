
import 'package:freezed_annotation/freezed_annotation.dart';
part "home_state.freezed.dart";


@Freezed()
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(25.0) double temperature,
    @Default(1) int speed,
    @Default(0.5) double sliderProgressValue,
  }) = _HomeState;
}