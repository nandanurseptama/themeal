abstract class Usecase<R, P>{
  Future<R> call(P params);
}
abstract class UsecaseParams{}
class NoParams extends UsecaseParams{}