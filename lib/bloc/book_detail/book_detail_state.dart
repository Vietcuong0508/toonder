part of 'book_detail_bloc.dart';

abstract class BookDetailState extends Equatable {
  const BookDetailState();

  @override
  List<Object> get props => [];
}

class BookDetailInitial extends BookDetailState {}

class BookDetailLoading extends BookDetailState {}

class BookDetailLoaded extends BookDetailState {
  final BookDetail book;
  const BookDetailLoaded(this.book);
}

class BookDetailError extends BookDetailState {
  final String? message;
  const BookDetailError(this.message);
}
