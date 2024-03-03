import 'package:carousel_slider/carousel_slider.dart';
import 'package:charity_management_app/common/widgets/custom_app_bar.dart';
import 'package:charity_management_app/common/widgets/my_drawer.dart';
import 'package:charity_management_app/features/dashboard/widgets/home_news_card.dart';
import 'package:charity_management_app/features/dashboard/widgets/home_post_card.dart';
import 'package:charity_management_app/features/news/controller/fetch_news.dart';
import 'package:charity_management_app/features/posts/data/post_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final List<String> imagesList = [
    'https://images.unsplash.com/photo-1497655392221-e645087843da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1532629345422-7515f3d16bb6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1459183885421-5cc683b8dbba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1597762117709-859f744b84c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ];
  final List<String> titles = [
    "Charity: Share Love, Change Lives.",
    "Give Back, Feel Good.",
    "Helping Hands, Healing Hearts.",
    "Generosity Matters: Make a Difference.",
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final newsData = ref.watch(newsProvider);
    final postData = ref.watch(postProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar(
        title: 'HOME',
      ),
      drawer: const MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Body
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _currentIndex = index;
                      },
                    );
                  },
                ),
                items: imagesList
                    .map(
                      (item) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Card(
                          margin: EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                          ),
                          elevation: 4.0,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                  item,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 500.h,
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 10,
                                  child: Text(
                                    titles[_currentIndex],
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 15.h),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '     Posts for Donation and Volunteer',
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 220.h,
                      width: double.infinity,
                      child: postData.when(
                        data: (data) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 190.w,
                                child: SmallPostCard(
                                  postData: data[index],
                                ),
                              );
                            },
                            itemCount: data.length,
                          );
                        },
                        error: (error, stack) => const Center(
                          child: Text('Error'),
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '     News',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 220.h,
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.background,
                      child: newsData.when(
                        data: (data) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 190.w,
                                child: SmallNewsCard(
                                  news: data[index],
                                ),
                              );
                            },
                            itemCount: data.length,
                          );
                        },
                        error: (error, stack) => const Center(
                          child: Text('Error'),
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
