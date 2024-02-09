import 'package:carousel_slider/carousel_slider.dart';
import 'package:charity_management_app/common/widgets/my_bottom_navbar.dart';
import 'package:charity_management_app/common/widgets/my_drawer.dart';
import 'package:charity_management_app/features/news/pages/news_page.dart';
import 'package:charity_management_app/features/notifications/presentation/notification_page.dart';
import 'package:charity_management_app/features/posts/data/post_data_source.dart';
import 'package:charity_management_app/features/posts/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mchango/utils/constants.dart';

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
    ' Help to make change ',
    ' Help to make change ',
    ' Help to make change ',
    ' Help to make change ',
  ];
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    final postData = ref.watch(postProvider);
    Size? size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Charity App',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
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
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          margin: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                          ),
                          elevation: 6.0,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Image.network(
                                  item,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 10,
                                  child: Text(
                                    '${titles[_currentIndex]}',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Colors.black45,
                                      color: Colors.white,
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

              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Urgent Fundraising',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                          Text(
                            'See all',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 230,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0),
                                      ),
                                      child: Image.asset('assets/Image1.png')),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Text(
                                          'Assist with Surgical',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const LinearProgressIndicator(
                                          color: Colors.black,
                                          backgroundColor: Colors.grey,
                                          value: 0.8,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                              text: const TextSpan(
                                                // Note: Styles for TextSpans must be explicitly defined.
                                                // Child text spans will inherit styles from parent
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "1,859",
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' Donators',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              text: const TextSpan(
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "3",
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' Days left',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0),
                                      ),
                                      child: Image.asset('assets/Image1.png')),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Text(
                                          'Assist with Food',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const LinearProgressIndicator(
                                          color: Colors.black,
                                          backgroundColor: Colors.grey,
                                          value: 0.8,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                              text: const TextSpan(
                                                // Note: Styles for TextSpans must be explicitly defined.
                                                // Child text spans will inherit styles from parent
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "1,859",
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' Donators',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              text: const TextSpan(
                                                // Note: Styles for TextSpans must be explicitly defined.
                                                // Child text spans will inherit styles from parent
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: "",
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: ' Days left',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Watch the Impacts',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                          Text(
                            'See all',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 180,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      child: Image.asset(
                                        'assets/image-1.png',
                                        width: 130,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      )),
                                  const Positioned(
                                    left: 5,
                                    bottom: 10,
                                    child: Text(
                                      'Sarah\'s surgery',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          backgroundColor: Colors.black26),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      child: Image.asset(
                                        'assets/image-1.png',
                                        width: 130,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      )),
                                  const Positioned(
                                    left: 5,
                                    bottom: 10,
                                    child: Text(
                                      'Sarah\'s surgery',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          backgroundColor: Colors.black26),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      child: Image.asset(
                                        'assets/image-1.png',
                                        width: 130,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      )),
                                  const Positioned(
                                    left: 5,
                                    bottom: 10,
                                    child: Text(
                                      'Sarah\'s surgery',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          backgroundColor: Colors.black26),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      child: Image.asset(
                                        'assets/image-1.png',
                                        width: 130,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      )),
                                  const Positioned(
                                    left: 5,
                                    bottom: 10,
                                    child: Text(
                                      'Sarah\'s surgery',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          backgroundColor: Colors.black26),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      
      
    );
  
  

  
  
  }
}
