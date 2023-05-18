part of 'hot_bloc.dart';

abstract class HotState extends Equatable {
  const HotState();

  @override
  List<Object> get props => [];
}

class HotInitial extends HotState {}

class HotLoading extends HotState {}

class HotLoaded extends HotState {
  final Hot hot;
  const HotLoaded(this.hot);
}

class HotError extends HotState {
  final String? message;
  const HotError(this.message);
}
