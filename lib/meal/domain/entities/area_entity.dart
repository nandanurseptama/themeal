import 'package:equatable/equatable.dart';
/// AreaEntity
///
/// a class to acomadate Area data
class AreaEntity extends Equatable{
  
  final String strArea;
  AreaEntity({required this.strArea});

  @override
  List<Object?> get props => [this.strArea];
}