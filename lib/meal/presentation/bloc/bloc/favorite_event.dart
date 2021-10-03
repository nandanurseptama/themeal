part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}
class GetFavoriteEvent extends FavoriteEvent{

}
class LikeOrUnlikeEvent extends FavoriteEvent{
  final MealEntity meal;
  LikeOrUnlikeEvent({required this.meal});
}