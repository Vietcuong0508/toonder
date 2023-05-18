part of 'banner_bloc.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {
  final BookBanner banner;
  const BannerLoaded(this.banner);
}

class BannerError extends BannerState {
  final String? message;
  const BannerError(this.message);
}
