import 'package:flutter/material.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_text_style.dart';
class Diet extends StatefulWidget {
  const Diet({super.key});

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        child: Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            Container(
              height: 120,
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                        color: lightGrey,
                        offset: Offset(4, 2),
                        blurRadius: 8),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -2),
                        blurRadius: 8)
                  ],
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.all(Radius.circular(20.0))),
              padding: const EdgeInsets.symmetric(
                  vertical: 25.0, horizontal: 20.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Balanced Diet',
                        style: dietTitleTextStyle,
                      ),
                      Text(
                        'Stay healthy and young by \n taking a balanced diet!',
                        style: dietTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(width: 20.0,)
                ],
              ),
            ),
            Positioned(
              right: -60.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10000.0),
                child: Image.asset(
                  'assets/images/diet.png',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));
  }
}
