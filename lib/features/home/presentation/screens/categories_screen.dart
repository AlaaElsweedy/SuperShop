import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/components/screen_status.dart';
import '../../../../core/utils/enums.dart';
import '../components/categories_item_component.dart';
import '../controllers/home/home_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.getCategoriesState != current.getCategoriesState,
      builder: (context, state) {
        //print('categories Screen state $state');
        switch (state.getCategoriesState) {
          case RequestState.isLoading:
            return const ShowCircularLoading();

          case RequestState.success:
            return Scaffold(
              appBar: const CustomAppBar(),
              body: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => CategoriesItemComponent(
                  data: state.getCategories!.data.products[index],
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.getCategories!.data.products.length,
              ),
            );
          case RequestState.error:
            return ShowError(
              networkExceptions: state.getCategoriesErrorMessage!,
            );
        }
      },
    );
  }
}
