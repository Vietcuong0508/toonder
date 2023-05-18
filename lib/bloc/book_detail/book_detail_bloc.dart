import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toonder_app/model/book_detail_model.dart';
import 'package:toonder_app/resources/api_repository.dart';

part 'book_detail_event.dart';
part 'book_detail_state.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  BookDetailBloc() : super(BookDetailInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetBookDetailList>((event, emit) async {
      emit(BookDetailLoading());
      final bookBloc =
          await _apiRepository.fetchBookDetail(event.book_id, event.account_id);
      if (bookBloc.responsecode! < 0) {
        emit(BookDetailError(bookBloc.description));
      } else {
        emit(BookDetailLoaded(bookBloc));
      }
    });
  }
}
