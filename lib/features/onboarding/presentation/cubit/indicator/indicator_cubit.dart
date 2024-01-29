import 'package:flutter_bloc/flutter_bloc.dart';

part 'indicator_state.dart';

class IndicatorCubit extends Cubit<IndicatorState> {
  IndicatorCubit() : super(IndicatorInitial());

  int currentIndex = 0;
  void changeIndicator() {
    emit(IndicatorIncrement());
  }
}
