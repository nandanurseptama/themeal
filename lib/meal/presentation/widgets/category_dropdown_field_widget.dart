import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/lang.dart';
import '../../../core/widgets/preloader_widget.dart';
import '../../domain/entities/category_entity.dart';
import '../bloc/categories_bloc/categories_bloc.dart';

class CategoryDropdownFieldWidget extends StatelessWidget {
  final CategoryEntity? value;
  final void Function(CategoryEntity? value) onChanged;
  const CategoryDropdownFieldWidget({ Key? key, required this.onChanged, required this.value }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      bloc: Modular.get<CategoriesBloc>(),
      builder: (context, state) {
        return 
        state is LoadedCategoriesState || state is FailureCategoriesState ?
        dropwdown(context: context, categories: state.categories) : preloader();
      },
    );
  }
  Widget dropwdown({required BuildContext context, required List<CategoryEntity> categories}){
    return Container(
          width: ScreenUtil().setWidth(160),
          child: DropdownButtonFormField<CategoryEntity?>(
            decoration: InputDecoration(
              labelText: AppLang.category,
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
            items: categories.map((e){
              return item(context: context, value: e);
            }).toList()..insert(0, all(context: context)),
          ),
        );
  }
  Widget preloader(){
    return PreloaderWidget(width: ScreenUtil().setWidth(160), height: ScreenUtil().setHeight(50));
  }
  DropdownMenuItem<CategoryEntity?> item({required BuildContext context, required CategoryEntity value}){
    return DropdownMenuItem<CategoryEntity?>(
      child: Text(
        value.strCategory,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      value: value,
    );
  }
  DropdownMenuItem<CategoryEntity?> all({required BuildContext context}){
    return DropdownMenuItem<CategoryEntity?>(
      child: Text(
        'All',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      value: null,
    );
  }
}