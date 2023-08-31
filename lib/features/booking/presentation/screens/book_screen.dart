// import 'package:busy_reader/features/books/presentation/bloc/bloc.dart';
// import 'package:busy_reader/features/books/presentation/widgets/book_card.dart';
// import 'package:busy_reader/features/books/presentation/widgets/loading_widget.dart';
// import 'package:busy_reader/res/assets/assets.gen.dart';
// import 'package:busy_reader/res/assets/colors.gen.dart';
// import 'package:busy_reader/theme/app_typography.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';
//
// class BookScreen extends StatefulWidget {
//   const BookScreen({super.key});
//
//   @override
//   State<BookScreen> createState() => _BookScreenState();
// }
//
// class _BookScreenState extends State<BookScreen> {
//   @override
//   void initState() {
//     BlocProvider.of<BookBloc>(context).add(GetBookEvent());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Рекомендации',
//                       style: AppTypography.mulishBold20
//                           .copyWith(color: ColorName.blackApp),
//                     ),
//                     Text(
//                       'Все книги',
//                       style: AppTypography.mulishSemiBold12
//                           .copyWith(color: ColorName.lightGray),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 BlocBuilder<BookBloc, BookState>(
//                   builder: (context, state) {
//                     double width = MediaQuery.of(context).size.width;
//                     double height = MediaQuery.of(context).size.height;
//                     var box = Hive.box('myBox');
//                     List<String>? like = box.get('like');
//                     if (state is EmptyState) {
//                       return const Text('Пусто');
//                     } else if (state is LoadingState) {
//                       return const LoadingWidget();
//                     } else if (state is LoadedState) {
//                       return SizedBox(
//                         height: height - 150,
//                         child: RefreshIndicator(
//                           onRefresh: () async {
//                             BlocProvider.of<BookBloc>(context)
//                                 .add(GetBookEvent());
//                             setState(() {});
//                           },
//                           child: ListView.builder(
//                             itemCount: state.book.data.length,
//                             shrinkWrap: true,
//                             scrollDirection: Axis.vertical,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: const EdgeInsets.only(bottom: 12),
//                                 child: BookCard(
//                                   info: state.book.data[index],
//                                   like: (like != null &&
//                                           like.contains(
//                                               state.book.data[index].id))
//                                       ? true
//                                       : false,
//                                   bookOnTap: () {
//                                     showModalBottomSheet(
//                                       context: context,
//                                       builder: (BuildContext context) {
//                                         return Container(
//                                           decoration: const BoxDecoration(
//                                             borderRadius: BorderRadius.only(
//                                               topLeft: Radius.circular(20),
//                                               topRight: Radius.circular(20),
//                                             ),
//                                           ),
//                                           height: 313,
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(16.0),
//                                             child: Center(
//                                               child: Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                 children: <Widget>[
//                                                   Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceBetween,
//                                                     children: [
//                                                       Text(
//                                                         'Выбор редакции',
//                                                         style: AppTypography
//                                                             .mulishBold20
//                                                             .copyWith(
//                                                                 color: ColorName
//                                                                     .blackApp),
//                                                       ),
//                                                       // использую стандартную иконку т.к. предложенная не отображается на экране
//                                                       InkWell(
//                                                         onTap: () {
//                                                           Navigator.pop(
//                                                               context);
//                                                         },
//                                                         child: const Icon(
//                                                             Icons.close),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   const SizedBox(height: 16),
//                                                   Row(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       SizedBox(
//                                                         height: 160,
//                                                         child: Image.asset(
//                                                           state.book.data[index]
//                                                               .image,
//                                                           fit: BoxFit.fitHeight,
//                                                         ),
//                                                       ),
//                                                       const SizedBox(width: 12),
//                                                       Column(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .start,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           SizedBox(
//                                                             width: width - 144,
//                                                             child: Text(
//                                                               state
//                                                                   .book
//                                                                   .data[index]
//                                                                   .name,
//                                                               style: AppTypography
//                                                                   .montserratSemiBold14
//                                                                   .copyWith(
//                                                                       color: ColorName
//                                                                           .blackApp),
//                                                             ),
//                                                           ),
//                                                           const SizedBox(
//                                                               height: 4),
//                                                           SizedBox(
//                                                             width: width - 144,
//                                                             child: Text(
//                                                               state
//                                                                   .book
//                                                                   .data[index]
//                                                                   .year,
//                                                               style: AppTypography
//                                                                   .montserratMedium12
//                                                                   .copyWith(
//                                                                       color: ColorName
//                                                                           .lightGray),
//                                                             ),
//                                                           ),
//                                                           const SizedBox(
//                                                               height: 4),
//                                                           SizedBox(
//                                                             width: width - 144,
//                                                             child: Text(
//                                                               state
//                                                                   .book
//                                                                   .data[index]
//                                                                   .author,
//                                                               style: AppTypography
//                                                                   .montserratBold12
//                                                                   .copyWith(
//                                                                       color: ColorName
//                                                                           .gray),
//                                                             ),
//                                                           ),
//                                                           const SizedBox(
//                                                               height: 4),
//                                                           SizedBox(
//                                                             width: width - 144,
//                                                             child: Text(
//                                                               state
//                                                                   .book
//                                                                   .data[index]
//                                                                   .description,
//                                                               style: AppTypography
//                                                                   .montserratMedium12
//                                                                   .copyWith(
//                                                                       color: ColorName
//                                                                           .blackApp),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       )
//                                                     ],
//                                                   ),
//                                                   const SizedBox(height: 24),
//                                                   StatefulBuilder(
//                                                     builder:
//                                                         (BuildContext context,
//                                                             stateWidget) {
//                                                       return InkWell(
//                                                         onTap: () async {
//                                                           setState(() {});
//                                                           stateWidget(() {});
//                                                           likeDoIt(
//                                                               like,
//                                                               state
//                                                                   .book
//                                                                   .data[index]
//                                                                   .id,
//                                                               box);
//                                                         },
//                                                         child: Container(
//                                                           height: 48,
//                                                           width: width - 32,
//                                                           decoration:
//                                                               BoxDecoration(
//                                                             color: ColorName
//                                                                 .blackApp,
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                               10.0,
//                                                             ),
//                                                           ),
//                                                           child: Row(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .center,
//                                                             children: [
//                                                               like != null &&
//                                                                       like.contains(state
//                                                                           .book
//                                                                           .data[
//                                                                               index]
//                                                                           .id)
//                                                                   ? Assets.icons
//                                                                       .heartFilled
//                                                                       .svg(
//                                                                           color: ColorName
//                                                                               .white)
//                                                                   : Assets.icons
//                                                                       .heart
//                                                                       .svg(
//                                                                           color:
//                                                                               ColorName.white),
//                                                               const SizedBox(
//                                                                   width: 8),
//                                                               Text(
//                                                                 'Добавить в избранное',
//                                                                 style: AppTypography
//                                                                     .montserratSemiBold14
//                                                                     .copyWith(
//                                                                         color: ColorName
//                                                                             .white),
//                                                               )
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       );
//                                                     },
//                                                   ),
//                                                   //const SizedBox(height: 15),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     );
//                                   },
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       );
//                     } else if (state is ErrorState) {
//                       return RefreshIndicator(
//                         onRefresh: () async {
//                           BlocProvider.of<BookBloc>(context)
//                               .add(GetBookEvent());
//                           setState(() {});
//                         },
//                         child: SizedBox(
//                           height: height - 200,
//                           child: ListView(children: [
//                             Padding(
//                               padding: EdgeInsets.only(top: height / 2 - 100),
//                               child: Center(
//                                 child: Text(
//                                   state.message,
//                                 ),
//                               ),
//                             ),
//                           ]),
//                         ),
//                       );
//                     }
//                     return Container();
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 // Bottom half
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// likeDoIt(like, id, box) async {
//   if (like == null) {
//     List<String> likes = [id];
//     await box.put('like', likes);
//   } else {
//     if (like.contains(id)) {
//       List<String> likes = like;
//       likes.remove(id);
//       await box.put('like', likes);
//     } else {
//       List<String> likes = like;
//       likes.add(id);
//       await box.put('like', likes);
//     }
//   }
// }
