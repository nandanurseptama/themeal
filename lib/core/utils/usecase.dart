import 'package:equatable/equatable.dart';

abstract class Usecase<R, P>{
  Future<R> call(P params);
}
abstract class UsecaseParams{}