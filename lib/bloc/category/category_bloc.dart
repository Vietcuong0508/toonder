import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toonder_app/model/category_model.dart';
import 'package:toonder_app/resources/api_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<GetCategoryList>((event, emit) async {
      emit(CategoryLoading());
      final categoryList = await apiRepository.fetchCategory();

      emit(CategoryLoaded(categoryList));
      if (categoryList.responsecode! < 0) {
        emit(CategoryError(categoryList.description));
      } else {
        emit(CategoryLoaded(categoryList));
      }
    });
  }
}
