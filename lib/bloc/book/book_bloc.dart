import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toonder_app/model/book_model.dart';
import 'package:toonder_app/resources/api_repository.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetBookList>((event, emit) async {
      emit(BookLoading());
      final bookList = await _apiRepository.fetchBookList();
      emit(BookLoaded(bookList));
      if (bookList.info == null) {
        emit(BookError(bookList.description));
      } else {
        emit(BookLoaded(bookList));
      }
    });
  }
}
