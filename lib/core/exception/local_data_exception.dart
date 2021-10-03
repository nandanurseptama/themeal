import '../constant/lang.dart';

class LocalDataSourceException implements Exception{
  final String reason;
  LocalDataSourceException({
    required this.reason,
  });
  factory LocalDataSourceException.hiveException({
    required String reason
  }){
    return LocalDataSourceException(reason: reason);
  }
  factory LocalDataSourceException.parseError({
    required String reason
  }){
    return LocalDataSourceException(reason: reason);
  }
  factory LocalDataSourceException.fromException({
    required Exception exception
  }){
    return LocalDataSourceException(reason: exception.toString());
  }
  factory LocalDataSourceException.internalError(){
    return LocalDataSourceException(
      reason: AppLang.internalError
    );
  }
}