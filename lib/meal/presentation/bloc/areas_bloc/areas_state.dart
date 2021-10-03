part of 'areas_bloc.dart';

abstract class AreasState extends Equatable {
  final List<AreaEntity> areas;
  final AreasEvent? event;
  final String? message;
  const AreasState({
    required this.areas,
    this.event,
    this.message,
  });
  
  @override
  List<Object?> get props => [
    this.event,
    this.areas,
    this.message,

  ];
}

class AreasInitial extends AreasState {
  AreasInitial() : super(areas: List<AreaEntity>.empty());
}
class OnLoadAreasState extends AreasState {
  final AreasEvent event;

  OnLoadAreasState({
    List<AreaEntity>? areas,
    required this.event
  }) : super(areas: areas ?? List<AreaEntity>.empty(), event: event);
}
class LoadedAreasState extends AreasState {

  final List<AreaEntity> areas;
  final AreasEvent event;

  LoadedAreasState({
    required this.areas,
    required this.event
  }) : super(areas: areas, event: event);
}
class FailureAreasState extends AreasState{

  final String message;
  final AreasEvent event;

  FailureAreasState({
    List<AreaEntity>? areas,
    required this.event,
    required this.message,
  }) : super(areas: areas ?? List<AreaEntity>.empty(), event: event, message: message);
}