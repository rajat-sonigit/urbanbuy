import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbanbuy/screens/homepage/components/category_item_page.dart';

class Gri extends StatelessWidget {
  const Gri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 11.0.h),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            CategoryItem(
              imageUrl: "lib/assets/cloths.jpg",
              title: 'Clothes',
            ),
            CategoryItem(
              imageUrl: "lib/assets/shoecat.jpg",
              title: 'Shoes',
            ),
            CategoryItem(
              imageUrl: "lib/assets/bagscat.jpg",
              title: 'Bags',
            ),
            CategoryItem(
              imageUrl: "lib/assets/watchcat.jpg",
              title: 'Watches',
            ),
            // Additional categories can be added here...
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CategoryItem({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: GestureDetector(
        onTap: () {
          // Handle category item tap
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryItemsPage(category: title),
            ),
          );
          // Navigate to the respective category page or perform any action here
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.r,
                    offset: Offset(0, 4.r),
                  ),
                ],
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(imageUrl),
                radius: 27.r,
              ),
            ),
            SizedBox(height: 6.h), // Add space between image and text
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
