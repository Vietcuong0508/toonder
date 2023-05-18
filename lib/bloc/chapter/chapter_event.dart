part of 'chapter_bloc.dart';

abstract class ChapterEvent extends Equatable {
  const ChapterEvent();

  @override
  List<Object> get props => [];
}

class GetChapter extends ChapterEvent {
  final String book_uuid;
  final int account_id;

  const GetChapter(this.book_uuid, this.account_id);

  @override
  List<Object> get props => [];
}
