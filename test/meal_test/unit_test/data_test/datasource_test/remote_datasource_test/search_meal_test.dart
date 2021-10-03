import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/constant/api_endpoint.dart';
import 'package:themeal/core/exception/remote_data_source_exception.dart';
import 'package:themeal/meal/data/datasource/remote_datasource.dart';
import 'package:themeal/meal/data/models/meal_model.dart';

import '../mock.dart';

void main(){
  final name = 'Egg';
  final dio = MockDio();

  const path = ApiEndpoint.areas;

  final remoteDataSource = MealRemoteDataSourceImpl(client: dio);

  group(
    'Meal Remote Data Source : #SearchMeal Test :',
    (){
      test(
        '#1. Should send get request to remote',
        ()async{
          await remoteDataSource.search(name: name);
          verify(dio.get(path));
        }
      );
      group(
        '#2. When sending get request to remote was return response with 200',
        (){
          setUp((){
            when(dio.get(path)).thenAnswer( (realInvocation) async=> meal200Response(path));
          });
          test(
            '#2.1 Should return list of MealModel',
            ()async{
              var result = await remoteDataSource.search(name: name);
              expect(result, expectedMealData());
            }
          );
        }
      );
      group(
        '#3. When sending get request to remote was return response with 400',
        (){
          setUp((){
            when(dio.get(path)).thenAnswer( (realInvocation) async=> meal400Response(path));
          });
          test(
            '#3.1 Should throw RemoteDataSourceException',
            ()async{
              var result = remoteDataSource.search(name: name);
              expect(()=>result, throwsA(isA<RemoteDataSourceException>()));
            }
          );
        }
      );
    }
  );

}
List<MealModel> expectedMealData(){
  var decoded = json.decode(loadMealJson());
  return (decoded['meals'] as List).map((e){
    return MealModel.fromJson(e);
  }).toList();
}
meal200Response(String path) => Response(
  data: json.decode(loadMealJson()),
  statusCode: 200,
  requestOptions: RequestOptions(
    path: path,
    cancelToken: null,
    method: 'GET'
  ),
);
meal400Response(String path) => Response(
  data: {'message':'Bad request'},
  statusCode: 400,
  requestOptions: RequestOptions(
    path: path,
    cancelToken: null,
    method: 'GET'
  ),
);