import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urbanbuy/screens/cart/cart_model.dart';
import 'package:urbanbuy/screens/search_results.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpperSection extends StatefulWidget {
  const UpperSection({super.key});

  @override
  State<UpperSection> createState() => _UpperSectionState();
}

class _UpperSectionState extends State<UpperSection> {
  final TextEditingController _searchController = TextEditingController();

  void _handleSearch() {
    String query = _searchController.text.toLowerCase();
    var searchResults =
        Provider.of<CartModel>(context, listen: false).searchProducts(query);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsPage(searchResults: searchResults),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('lib/assets/profile.jpg'),
                radius: 30.r,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello, Louis",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Good Morning 👋",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Spacer(),
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications_none, size: 30.sp),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: 11.w,
                    top: 11.h,
                    child: Container(
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12.w,
                        minHeight: 12.h,
                      ),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.favorite_outline_rounded, size: 30.sp),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 16.sp),
                    ),
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: IconButton(
                  icon: Icon(Icons.search, color: Colors.white, size: 30.sp),
                  onPressed: _handleSearch,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
