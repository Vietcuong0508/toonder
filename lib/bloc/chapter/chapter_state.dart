part of 'chapter_bloc.dart';

abstract class ChapterState extends Equatable {
  const ChapterState();

  @override
  List<Object> get props => [];
}

class ChapterInitial extends ChapterState {}

class ChapterLoading extends ChapterState {}

class ChapterLoaded extends ChapterState {
  final Chapter chapter;
  const ChapterLoaded(this.chapter);
}

class ChapterError extends ChapterState {
  final String? message;
  const ChapterError(this.message);
}
