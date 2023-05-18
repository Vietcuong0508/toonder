part of 'hot_bloc.dart';

abstract class HotEvent extends Equatable {
  const HotEvent();

  @override
  List<Object> get props => [];
}

class GetHotList extends HotEvent {}
