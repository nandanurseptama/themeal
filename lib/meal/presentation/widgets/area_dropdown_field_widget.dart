import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/lang.dart';
import '../../../core/widgets/preloader_widget.dart';
import '../../domain/entities/area_entity.dart';
import '../bloc/areas_bloc/areas_bloc.dart';

class AreaDropdownFieldWidget extends StatelessWidget {
  final AreaEntity? value;
  final void Function(AreaEntity? value) onChanged;
  const AreaDropdownFieldWidget({ Key? key, required this.onChanged, required this.value }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AreasBloc, AreasState>(
      bloc: Modular.get<AreasBloc>(),
      builder: (context, state) {
        return state is LoadedAreasState || state is FailureAreasState ?
        dropdown(context: context, areas: state.areas)
        : preloader();
      },
    );
  }
  Widget dropdown({required BuildContext context, required List<AreaEntity> areas}){
    if(areas.isEmpty){
      return SizedBox(height: 0);
    }
    return Container(
      width: ScreenUtil().setWidth(160),
      child: DropdownButtonFormField<AreaEntity?>(
        decoration: InputDecoration(
          labelText: AppLang.area,
          contentPadding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(0),
            horizontal: ScreenUtil().setWidth(10)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              ScreenUtil().setWidth(10)
            )
          )
        ),
        value: value,
        onChanged: (value) {
            this.onChanged(value);
        },
        items: areas.map((e){
          return item(context: context, value: e);
        }).toList()..insert(
          0,
          all(context: context),
        ),
      ),
    );
  }
  Widget preloader(){
    return PreloaderWidget(width: ScreenUtil().setWidth(160), height: ScreenUtil().setHeight(50));
  }
  DropdownMenuItem<AreaEntity?> item({required BuildContext context, required AreaEntity value}){
    return DropdownMenuItem<AreaEntity?>(
      child: Text(
        value.strArea,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      value: value,
    );
  }
  DropdownMenuItem<AreaEntity?> all({required BuildContext context}){
    return DropdownMenuItem<AreaEntity?>(
      child: Text(
        'All',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      value: null,
    );
  }
}