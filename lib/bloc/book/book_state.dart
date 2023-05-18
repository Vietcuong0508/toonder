part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final Books book;
  const BookLoaded(this.book);
}

class BookError extends BookState {
  final String? message;
  const BookError(this.message);
}
