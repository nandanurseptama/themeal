import 'package:equatable/equatable.dart';

import '../constant/lang.dart';
import '../exception/local_data_exception.dart';
/// repository response
/// 
/// a base class to facilitate repository
abstract class RepositoryResponse extends Equatable{
  final String message;
  final Object? data;
  RepositoryResponse({
    required this.message,
    this.data
  });
  @override
  List<Object?> get props => [
    this.message,
    this.data,
  ];
}
/// Success response
///
/// when repository success doing a job. Must be return this class
class SuccessResponse extends RepositoryResponse{
  final String message;
  final Object? data;
  SuccessResponse({
    this.message = 'OK',
    this.data,
  }) : super(message: message, data: data);

  SuccessResponse copyWith({
    String? message,
    Object? data,
  }){
    return SuccessResponse(message: message ?? this.message, data: data?? this.data);
  }
  
  factory SuccessResponse.withNullData(){
    return SuccessResponse(message: 'OK',data: null);
  }
}
/// FailureResponse response
///
/// when repository failre doing a job. Must return this class
class FailureResponse extends RepositoryResponse{
  final String message;
  final Object? data;
  final String reason;
  FailureResponse({
    required this.message,
    this.data,
    required this.reason,
  }) : super(message: message, data: data);

  FailureResponse copyWith({
    String? message,
    String? reason,
    Object? data,
  }){
    return FailureResponse(message: message ?? this.message, reason: reason ?? this.reason, data: data?? this.data);
  }

  factory FailureResponse.noInternetConnection(){
    return FailureResponse(
      message: AppLang.no_internet_connection,
      data: null, 
      reason: ''
    );
  }
  factory FailureResponse.internalError(){
    return FailureResponse(
      message: AppLang.internalError, 
      reason: AppLang.internalError
    );
  }
  factory FailureResponse.fromLocalDataSourceException({
    required String message,
    required LocalDataSourceException exception
  }){
    return FailureResponse(
      message: message,
      reason: exception.reason,
      data: null,
    );
  }
  @override
  List<Object?> get props => [
    this.message,
    this.data,
    this.reason,
  ];
  
}