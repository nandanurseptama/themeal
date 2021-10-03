import 'package:themeal/core/utils/response.dart';
import 'package:themeal/meal/domain/entities/area_entity.dart';
import 'package:themeal/meal/domain/entities/category_entity.dart';
import 'package:themeal/meal/domain/entities/meal_entity.dart';

var getAreaUsecaseFailureResponse = FailureResponse.internalError();
var getAreaUsecaseSuccessResponse = SuccessResponse(
  data: List<AreaEntity>.empty()
);
var getCategoryUsecaseSuccessResponse = SuccessResponse(
  data: List<CategoryEntity>.empty()
);
var getCategoryUsecaseFailureResponse = FailureResponse.internalError();
var searchMealUsecaseSuccessResponse = SuccessResponse(
  data: List<MealEntity>.empty(),
);
var searchMealUsecaseFailureResponse = FailureResponse.internalError();
var getDetailMealUsecaseSuccessResponse = SuccessResponse(
  data: null,
);
var getDetailMealUsecaseFailureResponse = FailureResponse.internalError();