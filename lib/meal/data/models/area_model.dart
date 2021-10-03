import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';

import '../../domain/entities/area_entity.dart';

part 'area_model.g.dart';

/// AreaModel
///
/// a class to modelling Area data from remote

@JsonSerializable()
class AreaModel extends AreaEntity{
  
  final String strArea;

  AreaModel({required this.strArea}) : super(strArea: strArea);

  factory AreaModel.fromJson(Map<String, dynamic> json) => _$AreaModelFromJson(json);
  Map<String, dynamic> toJson() => _$AreaModelToJson(this);
}
/// AreaTable
///
/// a class to modelling Area data from local data
class AreaTable extends Table{
  
  IntColumn get id => integer().autoIncrement()();

  TextColumn get strArea => text().customConstraint('UNIQUE')();

  AreaModel toModel(){
    return AreaModel(
      strArea: this.strArea.toString(),
    );
  }
}