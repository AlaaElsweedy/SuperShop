import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/home/get_home.dart';

class CarousalSliderComponent extends StatelessWidget {
  final GetHome homeBanner;

  const CarousalSliderComponent({
    Key? key,
    required this.homeBanner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: homeBanner.data.banners
          .map(
            (e) => CachedNetworkImage(
              imageUrl: e.image,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 200.h,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
