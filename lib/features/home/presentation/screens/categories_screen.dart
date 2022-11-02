import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supershop/core/components/custom_app_bar.dart';
import 'package:supershop/core/components/custom_drawer.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/features/home/presentation/components/categories_item_component.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.getCategoriesState != current.getCategoriesState,
      builder: (context, state) {
        print('categories Screen state $state');
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
