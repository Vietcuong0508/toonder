import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toonder_app/model/chapter_model.dart';
import 'package:toonder_app/resources/api_repository.dart';

part 'chapter_event.dart';
part 'chapter_state.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  ChapterBloc() : super(ChapterInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetChapter>((event, emit) async {
      emit(ChapterLoading());
      final bookBloc =
          await _apiRepository.fetchChapter(event.book_uuid, event.account_id);
      if (bookBloc.responsecode! < 0) {
        emit(ChapterError(bookBloc.description));
      } else {
        emit(ChapterLoaded(bookBloc));
      }
    });
  }
}
