import 'package:mockito/mockito.dart';
import 'package:themeal/core/utils/response.dart';
import 'package:themeal/core/utils/usecase.dart';
import 'package:themeal/meal/domain/usecases/get_areas_usecase.dart';
import 'package:themeal/meal/domain/usecases/get_categories_usecase.dart';

import '../../domain_test/usecase_test/fixture.dart';


class MockGetCategoryUsecase extends Mock implements GetCategoryUsecase{

  @override
  Future<RepositoryResponse> call(NoParams params) async{
    
    return super.noSuchMethod(
      Invocation.genericMethod(#call, [], []),
      returnValue: Future.value(
        getCategoryUsecaseSuccessResponse,
      ),
      returnValueForMissingStub: Future.value(
        getCategoryUsecaseSuccessResponse
      )
    );
  }
}
class MockGetAreaUsecase extends Mock implements GetAreasUsecase{

  @override
  Future<RepositoryResponse> call(NoParams params) async{
    
    return super.noSuchMethod(
      Invocation.genericMethod(#call, [], []),
      returnValue: Future.value(
        getAreaUsecaseSuccessResponse,
      ),
      returnValueForMissingStub: Future.value(
        getAreaUsecaseSuccessResponse
      )
    );
  }
}