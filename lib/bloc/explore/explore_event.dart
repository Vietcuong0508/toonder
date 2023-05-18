part of 'explore_bloc.dart';

abstract class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

class GetRankBook extends ExploreEvent {
  // ignore: non_constant_identifier_names
  final int type_rank;
  // ignore: non_constant_identifier_names
  final int order_type;

  GetRankBook(this.type_rank, this.order_type);

  @override
  List<Object> get props => [];
}

class GetCategoryBook extends ExploreEvent {
  // ignore: non_constant_identifier_names
  final int category_id;
  // ignore: non_constant_identifier_names
  final int order_type;

  GetCategoryBook(this.category_id, this.order_type);

  @override
  List<Object> get props => [];
}

class GetReleaseScheduleBook extends ExploreEvent {
  // ignore: non_constant_identifier_names
  final int week_day;
  // ignore: non_constant_identifier_names
  final int order_type;

  GetReleaseScheduleBook(this.week_day, this.order_type);

  @override
  List<Object> get props => [];
}
