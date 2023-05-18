import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toonder_app/model/explore_model.dart';
import 'package:toonder_app/resources/api_repository.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreInitial()) {
    final ApiRepository _apiRep = ApiRepository();

    on<GetRankBook>((event, emit) async {
      emit(ExploreLoading());
      final bookBloc =
          await _apiRep.fetchRankBook(event.type_rank, event.order_type);
      if (bookBloc.responsecode! < 0) {
        emit(ExploreError(bookBloc.description));
      } else {
        emit(ExploreLoaded(bookBloc));
      }
    });

    on<GetCategoryBook>((event, emit) async {
      emit(ExploreLoading());
      final bookBloc =
          await _apiRep.fetchCategoryBook(event.category_id, event.order_type);
      if (bookBloc.responsecode! < 0) {
        emit(ExploreError(bookBloc.description));
      } else {
        emit(ExploreLoaded(bookBloc));
      }
    });

    on<GetReleaseScheduleBook>((event, emit) async {
      emit(ExploreLoading());
      final bookBloc = await _apiRep.fetchReleaseScheduleBook(
          event.week_day, event.order_type);
      if (bookBloc.responsecode! < 0) {
        emit(ExploreError(bookBloc.description));
      } else {
        emit(ExploreLoaded(bookBloc));
      }
    });
  }
}
