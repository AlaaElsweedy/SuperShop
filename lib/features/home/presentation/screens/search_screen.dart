import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supershop/core/components/custom_text_button.dart';
import 'package:supershop/core/components/custom_text_form_field.dart';
import 'package:supershop/core/components/my_dividers.dart';
import 'package:supershop/core/components/screen_status.dart';
import 'package:supershop/core/utils/app_size.dart';
import 'package:supershop/core/utils/enums.dart';
import 'package:supershop/features/home/presentation/components/search_item_component.dart';
import 'package:supershop/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:supershop/generated/locale_keys.g.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 60.h,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                children: [
                  SizedBox(
                    height: 40.h,
                    width: 250.w,
                    child: CustomTextFormField(
                      context: context,
                      hintText: 'What are you looking for?',
                      validator: (value) => null,
                      autoFocus: true,
                      controller: searchController,
                      type: TextInputType.text,
                      prefixIcon: const Icon(Icons.search),
                      onChange: (text) {
                        context.read<HomeBloc>().add(SearchProductsEvent(text));
                      },
                    ),
                  ),
                  const Spacer(),
                  CustomTextButton(
                    title: LocaleKeys.cancel.tr(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          body: state.searchProductsState == RequestState.isLoading
              ? const ShowCircularLoading()
              : state.searchProducts != null
                  ? searchController.text.isEmpty
                      ? Container()
                      : ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => SearchItemComponent(
                            product: state
                                .searchProducts!.data.searchProducts[index],
                          ),
                          separatorBuilder: (context, index) =>
                              const MyDivider(),
                          itemCount:
                              state.searchProducts!.data.searchProducts.length,
                        )
                  : Container(),
        );
      },
    );
  }
}
