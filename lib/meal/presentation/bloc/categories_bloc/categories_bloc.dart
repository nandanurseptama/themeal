import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/response.dart';
import '../../../../core/utils/usecase.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/usecases/get_categories_usecase.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoryUsecase getCategoryUsecase;

  CategoriesBloc({
    required this.getCategoryUsecase,
  }) : super(CategoriesInitial()) {
    on<LoadCategoriesEvent>(_loadCategoriesEvent);
  }
  Future<void> _loadCategoriesEvent(LoadCategoriesEvent event, Emitter emit)async{
    var prevState = state;
    emit(OnLoadCategories(event: event,categories: prevState.categories));
    var response = await getCategoryUsecase(NoParams());
    if(response is SuccessResponse){
      emit(LoadedCategoriesState(categories: response.data as List<CategoryEntity>, event: event));
    } else{
      response as FailureResponse;
      emit(FailureCategoriesState(event: event, message: response.message));
    }
  }
}
