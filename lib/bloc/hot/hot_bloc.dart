import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toonder_app/model/hot_model.dart';
import 'package:toonder_app/resources/api_repository.dart';

part 'hot_event.dart';
part 'hot_state.dart';

class HotBloc extends Bloc<HotEvent, HotState> {
  HotBloc() : super(HotInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<GetHotList>((event, emit) async {
      emit(HotLoading());
      final hotList = await apiRepository.fetchHot();

      emit(HotLoaded(hotList));
      if (hotList.responsecode! < 0) {
        emit(HotError(hotList.description));
      } else {
        emit(HotLoaded(hotList));
      }
    });
  }
}
