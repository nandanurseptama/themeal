import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/utils/usecase.dart';
import 'package:themeal/meal/domain/entities/category_entity.dart';
import 'package:themeal/meal/presentation/bloc/categories_bloc/categories_bloc.dart';

import '../../domain_test/usecase_test/fixture.dart';
import 'mock.dart';

void main(){
  late MockGetCategoryUsecase getCategoryUsecase;
  late  CategoriesBloc categoriesBloc;
  var event= LoadCategoriesEvent();
  setUp((){
    getCategoryUsecase = MockGetCategoryUsecase();
    categoriesBloc = CategoriesBloc(getCategoryUsecase: getCategoryUsecase);
  });
  group(
    'Categories Bloc Test : ',
    (){
      blocTest(
        '#1. When receive an event LoadCategories should get data from usecase',
        build: ()=> categoriesBloc,
        act: (bloc) => (bloc as CategoriesBloc).add(event),
        verify: (_){
          verify(getCategoryUsecase(NoParams()));
        }
      );
      blocTest(
        '#2. When getting data from usecase was success. Should emit [OnLoadCategories, LoadedCategoriesState]',
        build: ()=> categoriesBloc,
        act: (bloc) => (bloc as CategoriesBloc).add(event),
        expect: () => [
          OnLoadCategories(event: event, categories: List<CategoryEntity>.empty()),
          LoadedCategoriesState(event: event, categories: getCategoryUsecaseSuccessResponse.data as List<CategoryEntity>)
        ],
      );
      blocTest(
        '#3. When getting data from usecase was fail. Should emit [OnLoadCategories, FailureCategoriesState]',
        build: ()=> categoriesBloc,
        act: (bloc) => (bloc as CategoriesBloc).add(event),
        setUp: () => when(getCategoryUsecase(NoParams())).thenAnswer((realInvocation) async=>getCategoryUsecaseFailureResponse),
        expect: () => [
          OnLoadCategories(event: event, categories: List<CategoryEntity>.empty()),
          FailureCategoriesState(event: event, message: getCategoryUsecaseFailureResponse.message)
        ],
      );
    }
  );
}