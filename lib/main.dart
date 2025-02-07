import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_app/pages/map_page.dart';
import 'package:test_app/pages/profile_page.dart';
import 'package:test_app/widgets/listTile.dart';
import 'generated/assets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

  // await init.initMapkit(apiKey: '67306b3b-2ec8-4ef1-a608-96c65011a751');
}

var f = NumberFormat("###,###");

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController controller = PageController(initialPage: 0);
  NotchBottomBarController notchBottomBarController =
      NotchBottomBarController(index: 0);
  int _bottomNavIndex = 0;
  List main_interface_pages = [
    MapPage(),
    Center(
      child: Text("sec"),
    ),
    Center(
      child: Text("third"),
    ),
    ProfilePage()
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    notchBottomBarController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: Stack(
        children: [
          PageView(
            controller: controller,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(main_interface_pages.length,
                (index) => main_interface_pages[index]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        isExtended: false,
        shape: StadiumBorder(),
        child: Container(
          width: 100,
          height: 100,
          padding: EdgeInsets.all(13),
          child: SvgPicture.asset(Assets.iconsCarIcon),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xffB7FCEB),
                  Color(0xffB0C7EE),
                  Color(0xff9A22F9),
                ],
              )),
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        iconSize: 30,
        icons: [
          Icons.map_outlined,
          Icons.history_outlined,
          CupertinoIcons.chat_bubble,
          CupertinoIcons.person
        ],
        activeColor: Color(0xff9D36F8),
        activeIndex: _bottomNavIndex,
        inactiveColor: Color(0xff8E8E93),
        gapLocation: GapLocation.center,
        notchMargin: 10,
        notchSmoothness: NotchSmoothness.softEdge,
        height: 70,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            controller.animateToPage(_bottomNavIndex,
                duration: Duration(milliseconds: 200), curve: Curves.linear);
            print(index);
          });
        },
        //other params
      ),
    );
  }
}
