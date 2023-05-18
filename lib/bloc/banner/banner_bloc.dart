import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toonder_app/model/banner_model.dart';
import 'package:toonder_app/resources/api_repository.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc() : super(BannerInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<GetBannerList>((event, emit) async {
      emit(BannerLoading());
      final bannerList = await apiRepository.fetchBannerList();

      emit(BannerLoaded(bannerList));
      if (bannerList.responsecode! < 0) {
        emit(BannerError(bannerList.description));
      } else {
        emit(BannerLoaded(bannerList));
      }
    });
  }
}
