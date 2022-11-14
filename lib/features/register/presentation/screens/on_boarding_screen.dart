import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/components/navigation.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/styles/app_colors.dart';
import 'sign_up_screen.dart';
import '../../../../generated/locale_keys.g.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/explore.svg',
      title: LocaleKeys.explore.tr(),
      body: LocaleKeys.exploreBody.tr(),
    ),
    BoardingModel(
      image: 'assets/images/free_shipping.svg',
      title: LocaleKeys.shipping.tr(),
      body: LocaleKeys.shippingBody.tr(),
    ),
    BoardingModel(
      image: 'assets/images/payment.svg',
      title: LocaleKeys.payment.tr(),
      body: LocaleKeys.paymentBody.tr(),
    ),
  ];
  bool isLast = false;

  void submit() async {
    CacheHelper.saveData(key: 'isOnBoardingSeen', value: true).then((value) {
      if (value) {
        navigateAndFinish(
          context,
          SignUpScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: TextButton(
              onPressed: submit,
              child: Text(
                LocaleKeys.skip.tr(),
                style: TextStyle(
                  color: AppColors.primaryColorLight,
                  fontSize: 18.0.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: AppSize.paddingAll20,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index], context),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  effect: ExpandingDotsEffect(
                    dotColor: AppColors.pageIndicatorInActiveDotColorLight,
                    activeDotColor: AppColors.pageIndicatorActiveDotColorLight,
                    dotHeight: 10.h,
                    expansionFactor: 3.w,
                    dotWidth: 10.w,
                    spacing: 5.0.w,
                  ),
                  count: boarding.length,
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      pageController.nextPage(
                        duration: const Duration(
                          milliseconds: 75,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 25.w,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model, context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SvgPicture.asset(model.image),
          ),
          AppSize.sizedBox28(context),
          Text(
            model.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          AppSize.sizedBox15(context),
          Text(
            model.body,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          AppSize.sizedBox28(context),
        ],
      );
}
