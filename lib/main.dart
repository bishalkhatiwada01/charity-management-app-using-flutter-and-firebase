import 'package:charity_management_app/api/fiebase_api.dart';
import 'package:charity_management_app/common/themes/dark_theme.dart';
import 'package:charity_management_app/common/themes/light_theme.dart';
import 'package:charity_management_app/common/widgets/my_bottom_navbar.dart';
import 'package:charity_management_app/features/dashboard/home_page.dart';
import 'package:charity_management_app/features/dashboard/splash_screen.dart';
import 'package:charity_management_app/features/news/presentation/news_page.dart';
import 'package:charity_management_app/features/notifications/presentation/notification_page.dart';
import 'package:charity_management_app/features/posts/pages/post_page.dart';
import 'package:charity_management_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return SafeArea(
          child: KhaltiScope(
            publicKey: 'test_public_key_49536e9f1a424b6fa5c79d0b85b765f6',
            enabledDebugging: true,
            builder: (context, navigatorKey) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Charity Management App',
                theme: lightMode,
                darkTheme: darkMode,
                home: child,
                supportedLocales: const [
                  Locale('en', 'US'),
                  Locale('ne', 'NP'),
                ],
                localizationsDelegates: const [
                  KhaltiLocalizations.delegate,
                ],
                navigatorKey: navigatorKey,
              );
            },
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pages = [
    const HomePage(),
    const PostPage(),
    const NewsPage(),
    NotificationPage()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
