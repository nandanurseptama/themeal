import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:themeal/core/constant/api_endpoint.dart';
import 'package:themeal/core/exception/remote_data_source_exception.dart';
import 'package:themeal/meal/data/datasource/remote_datasource.dart';
import 'package:themeal/meal/data/models/area_model.dart';

import '../mock.dart';

void main(){
  final dio = MockDio();

  const path = ApiEndpoint.areas;

  final remoteDataSource = MealRemoteDataSourceImpl(client: dio);

  group(
    'Meal Remote Data Source : #GetArea Test :',
    (){
      test(
        '#1. Should send get request to remote',
        ()async{
          await remoteDataSource.areas;
          verify(dio.get(path));
        }
      );
      group(
        '#2. When sending get request to remote was return response with 200',
        (){
          setUp((){
            when(dio.get(path)).thenAnswer( (realInvocation) async=> area200Response(path));
          });
          test(
            '#2.1 Should return list of AreaModel',
            ()async{
              var result = await remoteDataSource.areas;
              expect(result, expectedAreaData());
            }
          );
        }
      );
      group(
        '#3. When sending get request to remote was return response with 400',
        (){
          setUp((){
            when(dio.get(path)).thenAnswer( (realInvocation) async=> area400Response(path));
          });
          test(
            '#3.1 Should throw RemoteDataSourceException',
            ()async{
              var result = remoteDataSource.areas;
              expect(()=>result, throwsA(isA<RemoteDataSourceException>()));
            }
          );
        }
      );
    }
  );

}
List<AreaModel> expectedAreaData(){
  var decoded = json.decode(loadAreaJson());
  return (decoded['meals'] as List).map((e){
    return AreaModel.fromJson(e);
  }).toList();
}
area200Response(String path) => Response(
  data: json.decode(loadAreaJson()),
  statusCode: 200,
  requestOptions: RequestOptions(
    path: path,
    cancelToken: null,
    method: 'GET'
  ),
);
area400Response(String path) => Response(
  data: {'message':'Bad request'},
  statusCode: 400,
  requestOptions: RequestOptions(
    path: path,
    cancelToken: null,
    method: 'GET'
  ),
);