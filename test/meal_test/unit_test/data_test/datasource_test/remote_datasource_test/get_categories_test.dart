import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/constant/api_endpoint.dart';
import 'package:themeal/core/exception/remote_data_source_exception.dart';
import 'package:themeal/meal/data/datasource/remote_datasource.dart';
import 'package:themeal/meal/data/models/category_model.dart';

import '../mock.dart';

void main(){
  final dio = MockDio();

  const path = ApiEndpoint.categories;

  final remoteDataSource = MealRemoteDataSourceImpl(client: dio);

  group(
    'Meal Remote Data Source : #GetCategory Test :',
    (){
      test(
        '#1. Should send get request to remote',
        ()async{
          await remoteDataSource.categories;
          verify(dio.get(path));
        }
      );
      group(
        '#2. When sending get request to remote was return response with 200',
        (){
          setUp((){
            when(dio.get(path)).thenAnswer( (realInvocation) async=> cataegory200Response(path));
          });
          test(
            '#2.1 Should return list of CategoryModel',
            ()async{
              var result = await remoteDataSource.categories;
              expect(result, expectedCategoriesData());
            }
          );
        }
      );
      group(
        '#3. When sending get request to remote was return response with 400',
        (){
          setUp((){
            when(dio.get(path)).thenAnswer( (realInvocation) async=> category400Response(path));
          });
          test(
            '#3.1 Should throw RemoteDataSourceException',
            ()async{
              var result = remoteDataSource.categories;
              expect(()=>result, throwsA(isA<RemoteDataSourceException>()));
            }
          );
        }
      );
    }
  );

}
List<CategoryModel> expectedCategoriesData(){
  var decoded = json.decode(loadCategoryJson());
  return (decoded['categories'] as List).map((e){
    return CategoryModel.fromJson(e);
  }).toList();
}
cataegory200Response(String path) => Response(
  data: json.decode(loadCategoryJson()),
  statusCode: 200,
  requestOptions: RequestOptions(
    path: path,
    cancelToken: null,
    method: 'GET'
  ),
);
category400Response(String path) => Response(
  data: {'message':'Bad request'},
  statusCode: 400,
  requestOptions: RequestOptions(
    path: path,
    cancelToken: null,
    method: 'GET'
  ),
);