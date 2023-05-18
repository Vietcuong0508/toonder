part of 'explore_bloc.dart';

abstract class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final ExploreBooks books;
  const ExploreLoaded(this.books);
}

class ExploreError extends ExploreState {
  final String? message;
  const ExploreError(this.message);
}
