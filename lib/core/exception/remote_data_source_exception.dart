import '../constant/lang.dart';

class RemoteDataSourceException implements Exception{
  final String reason;
  RemoteDataSourceException({
    required this.reason,
  });
  factory RemoteDataSourceException.badRequest(){
    return RemoteDataSourceException(reason: 'Bad Request');
  }
  factory RemoteDataSourceException.notFound(){
    return RemoteDataSourceException(reason: 'Not Found');
  }
  factory RemoteDataSourceException.internalServerError(){
    return RemoteDataSourceException(reason: 'Internal Server Error');
  }
  factory RemoteDataSourceException.parseError({
    required String reason
  }){
    return RemoteDataSourceException(reason: reason);
  }
  factory RemoteDataSourceException.fromException({
    required Exception exception
  }){
    return RemoteDataSourceException(reason: exception.toString());
  }
  factory RemoteDataSourceException.internalError(){
    return RemoteDataSourceException(
      reason: AppLang.internalError
    );
  }
}