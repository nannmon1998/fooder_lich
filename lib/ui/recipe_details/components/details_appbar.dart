import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../model/recipe.dart';
import '../../../res/app_colors.dart';

// class DetailsAppBar extends StatelessWidget {
//   Recipe recipe;
//   DetailsAppBar({super.key,required this.recipe});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 color: whiteColor,
//                 borderRadius: BorderRadius.all(Radius.circular(8.0))
//             ),
//             child: IconButton(
//               onPressed: (){
//                 Navigator.pop(context);
//               },
//               icon: const Icon(Icons.arrow_back_ios_new,)
//             ),
//           ),
//           Container(
//             decoration: const BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 color: whiteColor,
//                 borderRadius: BorderRadius.all(Radius.circular(8.0))
//             ),
//             child: IconButton(
//                 onPressed: () {
//                   // repository.insertRecipe(recipe);
//                 },
//                 icon: SvgPicture.asset(
//                   'assets/images/icon_bookmark.svg',
//                   color: shim,
//                 ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

