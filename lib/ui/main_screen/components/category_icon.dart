import 'package:flutter/material.dart';
import '../../../res/app_colors.dart';

class CategoryIcon extends StatefulWidget {
  String imageUrl;
  final void Function()? onTap;
  bool isSelected;

  CategoryIcon({super.key, required this.imageUrl,required this.onTap,
    required this.isSelected});

  @override
  State<CategoryIcon> createState() => _CategoryIconState();
}

class _CategoryIconState extends State<CategoryIcon> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration:  BoxDecoration(
            shape: BoxShape.rectangle,
            boxShadow: const [
              BoxShadow(
                  color: lightGrey, offset: Offset(4, 2), blurRadius: 8),
              BoxShadow(
                  color: Colors.white, offset: Offset(-4, -2), blurRadius: 8)
            ],
            color: widget.isSelected == true ? greenColor : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        child: Image.asset(
            widget.imageUrl,
            color: widget.isSelected == true ? whiteColor : greenColor,
            width: 40,
            height: 40,
          ),
      ),
    );
  }
}
