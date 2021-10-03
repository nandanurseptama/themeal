import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/response.dart';
import '../../../../core/utils/usecase.dart';
import '../../../domain/entities/area_entity.dart';
import '../../../domain/usecases/get_areas_usecase.dart';

part 'areas_event.dart';
part 'areas_state.dart';

class AreasBloc extends Bloc<AreasEvent, AreasState> {
  final GetAreasUsecase getAreasUsecase;

  AreasBloc({
    required this.getAreasUsecase,
  }) : super(AreasInitial()) {
    on<LoadAreaEvent>(_loadAreasEvent);
  }
  Future<void> _loadAreasEvent(LoadAreaEvent event, Emitter emit)async{
    var prevState = state;
    emit(OnLoadAreasState(event: event,areas: state.areas));
    var response  = await getAreasUsecase(NoParams());
    if(response is SuccessResponse){
      emit(LoadedAreasState(areas: response.data as List<AreaEntity>, event: event));
    } else{
      emit(FailureAreasState(event: event, message: response.message, areas: prevState.areas));
    }
  }
}
