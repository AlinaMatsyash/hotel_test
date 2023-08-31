// import 'package:busy_reader/features/books/data/models/hotel_model.dart';
// import 'package:busy_reader/features/books/presentation/screens/book_screen.dart';
// import 'package:busy_reader/res/assets/assets.gen.dart';
// import 'package:busy_reader/res/assets/colors.gen.dart';
// import 'package:busy_reader/theme/app_typography.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
//
// class BookCard extends StatefulWidget {
//   BookCard({
//     required this.info,
//     required this.bookOnTap,
//     required this.like,
//     super.key,
//   });
//
//   bool like;
//   BookInfo info;
//
//   Function() bookOnTap;
//
//   @override
//   State<BookCard> createState() => _BookCardState();
// }
//
// class _BookCardState extends State<BookCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: ColorName.drab,
//       ),
//       child: Padding(
//         padding:
//             const EdgeInsets.only(top: 16, left: 16, bottom: 16, right: 24),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             InkWell(
//               onTap: widget.bookOnTap,
//               child: Row(
//                 children: [
//                   Image.asset(widget.info.image),
//                   const SizedBox(width: 16),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 191,
//                         child: Text(
//                           widget.info.name,
//                           style: AppTypography.montserratSemiBold14
//                               .copyWith(color: ColorName.blackApp),
//                         ),
//                       ),
//                       Text(
//                         widget.info.year,
//                         style: AppTypography.montserratMedium12
//                             .copyWith(color: ColorName.lightGray),
//                       ),
//                       Text(
//                         widget.info.author,
//                         style: AppTypography.montserratBold12
//                             .copyWith(color: ColorName.gray),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             InkWell(
//               onTap: () async {
//                 var box = Hive.box('myBox');
//                 List<String>? like = box.get('like');
//                 setState(() {
//                   widget.like = !widget.like;
//                 });
//                 likeDoIt(like, widget.info.id, box);
//               },
//               child: widget.like
//                   ? Assets.icons.heartFilled.svg(color: ColorName.red)
//                   : Assets.icons.heart.svg(color: ColorName.red),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
