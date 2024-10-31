// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/src/consumer.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:story_view/story_view.dart';
// import 'package:ya_ryadom/core/utilities/singletons/user_data_singleton.dart';
// import 'package:ya_ryadom/core/theme/app_themes.dart';
// import 'package:ya_ryadom/core/theme/colors/app_color.dart';
// import 'package:ya_ryadom/core/theme/colors/style.dart';
// import 'package:ya_ryadom/core/theme/colors/typography.dart';
// import 'package:ya_ryadom/core/utilities/extensions/context_shortcuts.dart';
// import 'package:ya_ryadom/core/utilities/singletons/pusher_web_rtc_singleton.dart';
// import 'package:ya_ryadom/core/widget/app_scaffold.dart';
// import 'package:ya_ryadom/feature/app/router/path_route.dart';
// import 'package:ya_ryadom/feature/app/state/app_manager.dart';
// import 'package:ya_ryadom/feature/home_page/presentation/widgets/other_option_widget.dart';
// import 'package:ya_ryadom/feature/video_call_page/domain/pusher_p2p/pusher_channel.dart';
// import 'package:ya_ryadom/resources/resources.dart';
//
// class HomeScreen extends ConsumerStatefulWidget {
//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   late Pusher pusher;
//   bool isAccept = false;
//   late Future<PusherChannel> pusherChanel;
//
//   @override
//   void initState() {
//     print('appData.isNewUser ${userDataSingleton.firstRegisterOrSignIn}');
//     // Future(() {
//     //   /// if new user socket will opened after confirm pin
//     //   // TODO раскоментить для webrtc
//     //   if (userDataSingleton.isNewUser==false) {
//     //     appPusherData.initPusher(context: context, ref: ref);
//     //   }
//     // });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AppScaffold(
//       title: context.$.main,
//       body: AnimationLimiter(
//         child: Column(
//           children: AnimationConfiguration.toStaggeredList(
//             duration: const Duration(milliseconds: 200),
//             childAnimationBuilder: (widget) => SlideAnimation(
//               verticalOffset: 50.0,
//               child: FadeInAnimation(
//                 child: widget,
//               ),
//             ),
//             children: [
//               SizedBox(height: 30),
//               StoriesWidget(),
//               MotivationWidget(),
//               SizedBox(height: 20),
//               GradientBannerWidget(
//                 title: context.$.psyhologist,
//                 description: context.$.chooseFrom,
//                 btnText: context.$.choose,
//                 imagePath: AppImages.saly,
//                 width: 100,
//                 onPress: () {
//                   context.go(AppRoute.sessionScreenRoute);
//                 },
//               ),
//               SizedBox(height: 10),
//               GradientBannerWidget(
//                 width: 200,
//                 title: context.$.psychoTest,
//                 description: context.$.usePsychoTest,
//                 btnText: context.$.choosePsychoTest,
//                 gradient: AppColors.gradientPurple,
//                 onPress: () {
//                   context.goNamed(AppRoute.psychoTestRoute);
//                 },
//               ),
//               SizedBox(
//                 height: 4,
//               ),
//               SizedBox(
//                 height: 160,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: OtherOptionWidget(
//                         title: context.$.storiesAndBooks,
//                         subTitle: context.$.read,
//                         icon: AppImages.books,
//                         onTap: () {
//                           context.goNamed(AppRoute.newsPage);
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Expanded(
//                       child: OtherOptionWidget(
//                         title: context.$.myDiary,
//                         subTitle: context.$.goTo,
//                         icon: AppImages.note,
//                         onTap: () => GoRouter.of(context).go(AppRoute.diaryScreenRoute),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 4,
//               ),
//               OtherOptionWidget(
//                 title: context.$.meditation,
//                 description: context.$.meditationDescription,
//                 subTitle: context.$.meditationNow,
//                 icon: AppImages.meditation,
//                 onTap: () {
//                   GoRouter.of(context).go(AppRoute.meditationFirstRoute);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class GradientBannerWidget extends StatelessWidget {
//   final String? imagePath;
//   final String? title;
//   final String? btnText;
//   final String? description;
//   final double width;
//   final LinearGradient? gradient;
//   final VoidCallback? onPress;
//
//   const GradientBannerWidget({
//     this.imagePath,
//     this.gradient,
//     this.description,
//     this.btnText,
//     this.title,
//     this.onPress,
//     required this.width,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 180,
//       decoration: BoxDecoration(
//         borderRadius: AppCorners.radius25,
//         gradient: gradient ?? AppColors.gradientLinearSkyBlue,
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             right: 10,
//             bottom: 0,
//             child: imagePath != null
//                 ? Image(
//                     image: AssetImage(imagePath!),
//                     height: 180,
//                   )
//                 : SizedBox(),
//           ),
//           Positioned(
//               left: 20,
//               top: 10,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title!,
//                     style: AppTypography.paragraphP1.copyWith(
//                       color: AppColors.white,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     description!,
//                     style: AppTypography.paragraphP2.copyWith(color: AppColors.white, fontSize: 13),
//                   ),
//                 ],
//               )),
//           Positioned(
//             bottom: 20,
//             left: 20,
//             child: SizedBox(
//               height: 30,
//               width: width,
//               child: ElevatedButton(
//                 onPressed: onPress,
//                 style: AppButtonStyle.primaryStyleWhiteRadius10,
//                 child: Text(btnText!),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MotivationWidget extends StatelessWidget {
//   const MotivationWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset(Vectors.sun),
//               SizedBox(width: 10),
//               Text(
//                 context.$.everyDayMotivation,
//                 style: AppTypography.paragraphP1.copyWith(
//                   color: AppColors.gray.shade60,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 5),
//           Text(
//             context.$.everyDayNewMinds,
//             style: AppTypography.paragraphP1.copyWith(
//               color: AppColors.gray,
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MoreStories extends StatefulWidget {
//   const MoreStories({required this.index, required this.storyItems, required this.storyController, Key? key})
//       : super(key: key);
//   final int index;
//   final List<StoryItem?> storyItems;
//   final StoryController storyController;
//
//   @override
//   _MoreStoriesState createState() => _MoreStoriesState();
// }
//
// class _MoreStoriesState extends State<MoreStories> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Hero(
//         tag: 'story_${widget.index}',
//         child: Stack(
//           children: [
//             StoryView(
//               storyItems: widget.storyItems,
//               onStoryShow: (s) {
//                 print("Showing a story");
//               },
//               onComplete: () {
//                 print("Completed a cycle");
//                 Navigator.of(context).pop;
//               },
//               onVerticalSwipeComplete: (val) {
//                 //переход на другой сторис
//               },
//               progressPosition: ProgressPosition.top,
//               repeat: false,
//               controller: widget.storyController,
//             ),
//             Icon(
//               Icons.close,
//               color: AppColors.white,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class StoriesWidget extends StatefulWidget {
//   const StoriesWidget({
//     super.key,
//   });
//
//   @override
//   State<StoriesWidget> createState() => _StoriesWidgetState();
// }
//
// class _StoriesWidgetState extends State<StoriesWidget> {
//   List<String> c = [
//     AppImages.stories,
//     AppImages.stories,
//     AppImages.stories,
//     AppImages.stories,
//     AppImages.stories,
//     AppImages.stories,
//     AppImages.stories,
//   ];
//   final storyController = StoryController();
//
//   @override
//   void dispose() {
//     storyController.dispose();
//     super.dispose();
//   }
//
//   final List<StoryItem?> storyItems = [];
//
//   getStories(List<StoryItem?> storyListItems) {
//     storyItems.addAll(storyListItems);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       child: AnimationLimiter(
//         child: ListView.separated(
//           physics: BouncingScrollPhysics(),
//           itemCount: 4,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return AnimationConfiguration.staggeredList(
//               position: index,
//               duration: const Duration(milliseconds: 500),
//               child: SlideAnimation(
//                 // verticalOffset: 500.0,
//                 horizontalOffset: 300,
//                 child: FadeInAnimation(
//                   child: GestureDetector(
//                     onTap: () {
//                       getStories([
//                         StoryItem.pageImage(
//                           url: '',
//                           caption: "Still sampling",
//                           controller: storyController,
//                         ),
//                         StoryItem.pageImage(
//                           url:
//                               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9wubJ11jIoHWW1q4x8FZiYIR61Aiu7iNCR900HG3u&s",
//                           caption: "Still sampling",
//                           controller: storyController,
//                         ),
//                       ]);
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => MoreStories(
//                               index: index,
//                               storyItems: addStories(
//                                   "https://cs12.pikabu.ru/post_img/big/2022/08/09/7/1660042588198544626.png"),
//                               storyController: storyController),
//                         ),
//                       );
//                     },
//                     child: Hero(
//                       tag: 'story_$index',
//                       child: Container(
//                         height: 100,
//                         width: 100,
//                         decoration: BoxDecoration(
//                             borderRadius: AppCorners.radius25, border: Border.all(color: AppColors.primaryColor)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(2.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: AppCorners.radius25,
//                               image: DecorationImage(image: AssetImage(AppImages.second), fit: BoxFit.fill),
//                             ),
//                             child: Align(
//                               alignment: Alignment.bottomLeft,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   context.$.howToBeFree,
//                                   style: AppTypography.paragraphP1
//                                       .copyWith(color: AppColors.white, fontWeight: FontWeight.w900, fontSize: 12),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return SizedBox(
//               width: 5,
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   List<StoryItem?> addStories(String link) {
//     return [
//       StoryItem.pageImage(
//         url: link,
//         caption: "Still sampling",
//         controller: storyController,
//       ),
//       StoryItem.pageImage(
//         url:
//             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD-YTaXf90G-8IWx6llFRzjmm0ctLDUlzwKg&usqp=CAUhttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD-YTaXf90G-8IWx6llFRzjmm0ctLDUlzwKg&usqp=CAU",
//         caption: "Still sampling",
//         controller: storyController,
//       ),
//     ];
//   }
// }
//
// // class SecondPage extends StatelessWidget {
// //   const SecondPage({required this.index, required this.images, Key? key}) : super(key: key);
// //   final int index;
// //   final List<String> images;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Material(
// //       child: Scaffold(
// //         backgroundColor: Colors.black,
// //         body: Hero(
// //           tag: 'story_$index',
// //           child: Container(
// //             // ваш код для содержимого второй страницы (сторис)
// //             child: Image(
// //               image: AssetImage(images[index]),
// //               fit: BoxFit.cover,
// //               width: double.infinity,
// //               height: double.infinity,
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
