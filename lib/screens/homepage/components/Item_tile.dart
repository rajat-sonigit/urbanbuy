import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:urbanbuy/screens/cart/cart_model.dart';

class ItemTile extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final String proDescription;
  final int index;

  const ItemTile({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.proDescription,
    required this.index,
  }) : super(key: key);

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> with TickerProviderStateMixin {
  bool isLiked = true;
  late AnimationController _controller;
  late Animation<double> _animation;
  String selectedSize = "M"; // Default size is "M"

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _appBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
            size: 20.sp,
            padding: 12.sp,
            isOutLine: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          _icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.red : Colors.grey,
            size: 20.sp,
            padding: 12.sp,
            isOutLine: false,
            onPressed: () {
              setState(() {
                isLiked = !isLiked;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _icon(
    IconData icon, {
    Color color = Colors.grey,
    double size = 20,
    double padding = 10,
    bool isOutLine = false,
    required Function() onPressed,
  }) {
    return Container(
      height: 40.h,
      width: 40.w,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13.r)),
        color: isOutLine ? Colors.transparent : Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Color(0xfff8f8f8),
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(5, 5)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    ).ripple(onPressed, borderRadius: BorderRadius.all(Radius.circular(13.r)));
  }

  Widget _productImage() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: _animation.value,
          child: child,
        );
      },
      child: Center(
        child: Image.asset(widget.imagePath, height: 300.h),
      ),
    );
  }

  Widget _productDetails() {
    return DraggableScrollableSheet(
      maxChildSize: 0.8,
      initialChildSize: 0.5,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    width: 50.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.itemName,
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.bold)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("\$",
                                style: TextStyle(
                                    fontSize: 18.sp, color: Colors.red)),
                            Text(widget.itemPrice,
                                style: TextStyle(fontSize: 24.sp)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.star, color: Colors.yellow, size: 20.sp),
                            Icon(Icons.star, color: Colors.yellow, size: 20.sp),
                            Icon(Icons.star, color: Colors.yellow, size: 20.sp),
                            Icon(Icons.star, color: Colors.yellow, size: 20.sp),
                            Icon(Icons.star_border,
                                color: Colors.yellow, size: 20.sp),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                _availableSize(),
                SizedBox(height: 20.h),
                _availableColor(),
                SizedBox(height: 20.h),
                _description(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Available Size", style: TextStyle(fontSize: 16.sp)),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _sizeWidget("S"),
            _sizeWidget("M"),
            _sizeWidget("L"),
            _sizeWidget("XL"),
          ],
        ),
      ],
    );
  }

  Widget _sizeWidget(String text, {bool isSelected = false}) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedSize = text;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey,
              style:
                  selectedSize == text ? BorderStyle.none : BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(13.r)),
          color: selectedSize == text ? Colors.black : Colors.white,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            color: selectedSize == text ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _availableColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Available Colors", style: TextStyle(fontSize: 16.sp)),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _colorWidget(Colors.yellow),
            SizedBox(width: 20.w),
            _colorWidget(Colors.blue),
            SizedBox(width: 20.w),
            _colorWidget(Colors.black),
            SizedBox(width: 20.w),
            _colorWidget(Colors.red),
            SizedBox(width: 20.w),
            _colorWidget(Colors.green),
          ],
        ),
      ],
    );
  }

  Widget _colorWidget(Color color) {
    return CircleAvatar(
      radius: 12.r,
      backgroundColor: color.withOpacity(0.5),
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Description",
            style: TextStyle(fontSize: 20.sp)), // Increased font size
        SizedBox(height: 10.h),
        Text(
          widget.proDescription,
          style: TextStyle(fontSize: 16.sp), // Increased font size
        ),
      ],
    );
  }

  FloatingActionButton _floatingButton(BuildContext context, int index) {
    return FloatingActionButton(
      onPressed: () {
        // Call addItemToCart method from CartModel with the index
        Provider.of<CartModel>(context, listen: false).addItemToCart(index);

        // Show a custom styled SnackBar for feedback
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black,
            elevation: 6.0, // Add elevation for a modern look
            behavior: SnackBarBehavior.floating, // Floating style
            content: Row(
              children: [
                Icon(Icons.check,
                    color: Colors.green), // Check icon for success
                SizedBox(width: 10.w),
                Text(
                  'Item added to cart',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ],
            ),
            duration: Duration(seconds: 2), // Adjust the duration as needed
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Implement undo functionality if needed
              },
            ),
          ),
        );
      },
      backgroundColor: Colors.black,
      child: Icon(Icons.shopping_cart, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingButton(context, widget.index),
      body: SafeArea(
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, child) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Color(0xfff7f7f7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      _appBar(),
                      _productImage(),
                    ],
                  ),
                  _productDetails(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

extension RippleExtension on Widget {
  Widget ripple(Function onPressed, {BorderRadius? borderRadius}) {
    return InkWell(
      onTap: () => onPressed(),
      borderRadius: borderRadius,
      child: this,
    );
  }
}
