import 'dart:ui';

import 'package:flutter/material.dart';

class TopRecipe extends StatelessWidget {
  const TopRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(8, 6), blurRadius: 12),
            BoxShadow(
                color: Colors.white, offset:  Offset(-8, -6), blurRadius: 12),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/top_recipe.jpg",
                  fit: BoxFit.fill,
                )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Top Recipe',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Kimchi Fried Rice',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Text(
                              'Google',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white70),
                            ),
                            VerticalDivider(color: Colors.white70,thickness: 2,),
                            Text(
                              '203 KCAL',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
