import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/utils/usecase.dart';
import 'package:themeal/meal/domain/entities/area_entity.dart';
import 'package:themeal/meal/presentation/bloc/areas_bloc/areas_bloc.dart';

import '../../domain_test/usecase_test/fixture.dart';
import 'mock.dart';

void main(){
  late MockGetAreaUsecase getAreasUsecase;
  late AreasBloc areasBloc;
  var event= LoadAreaEvent();
  setUp((){
    getAreasUsecase = MockGetAreaUsecase();
    areasBloc = AreasBloc(getAreasUsecase: getAreasUsecase);
  });
  group(
    'Categories Bloc Test : ',
    (){
      blocTest(
        '#1. When receive an event LoadAreasEvent should get data from usecase',
        build: ()=> areasBloc,
        act: (bloc) => (bloc as AreasBloc).add(event),
        verify: (_){
          verify(getAreasUsecase(NoParams()));
        }
      );
      blocTest(
        '#2. When getting data from usecase was success. Should emit [OnLoadAreasState, LoadedAreasState]',
        build: ()=> areasBloc,
        act: (bloc) => (bloc as AreasBloc).add(event),
        expect: () => [
          OnLoadAreasState(event: event, areas: List<AreaEntity>.empty()),
          LoadedAreasState(event: event, areas: getAreaUsecaseSuccessResponse.data as List<AreaEntity>)
        ],
      );
      blocTest(
        '#3. When getting data from usecase was fail. Should emit [OnLoadAreasState, FailureAreasState]',
        build: ()=> areasBloc,
        act: (bloc) => (bloc as AreasBloc).add(event),
        setUp: () => when(getAreasUsecase(NoParams())).thenAnswer((realInvocation) async=>getAreaUsecaseFailureResponse),
        expect: () => [
          OnLoadAreasState(event: event, areas: List<AreaEntity>.empty()),
          FailureAreasState(event: event, message: getAreaUsecaseFailureResponse.message)
        ],
      );
    }
  );
}