import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbanbuy/screens/homepage/components/griedview.dart';

class Sliderx extends StatelessWidget {
  const Sliderx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imagePathList = [
      // Local asset // Network image
      "lib/assets/crouselone.jpg",
      "lib/assets/crouseltwo.png"
    ];

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Special offers",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            const Spacer(),
            Text(
              "See All",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0.h),
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 160.h,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: imagePathList.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              String imagePath = imagePathList[itemIndex];
              if (imagePath.startsWith('http')) {
                // Network image
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2.r,
                        blurRadius: 7.r,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0.r),
                    child: Image.network(
                      imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              } else {
                // Local asset
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2.r,
                        blurRadius: 7.r,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0.r),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }
            },
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.16,
          width: MediaQuery.of(context).size.width,
          child: const Gri(),
        ),
      ],
    );
  }
}
