part of 'book_detail_bloc.dart';

abstract class BookDetailEvent extends Equatable {
  const BookDetailEvent();

  @override
  List<Object> get props => [];
}

class GetBookDetailList extends BookDetailEvent {
  final int book_id;
  final int account_id;

  const GetBookDetailList(this.book_id, this.account_id);

  @override
  List<Object> get props => [];
}
