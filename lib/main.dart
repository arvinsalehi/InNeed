import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/article.dart';
import 'package:flutter_application_2/gen/fonts.gen.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/profile.dart';
import 'package:flutter_application_2/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final primaryTextColor = const Color(0xff0d253c);
  final secondaryTextColor = const Color(0xff2D4379);
  final primaryColor = const Color(0xff376AED);

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: primaryColor,
            onPrimary: Colors.white,
            surface: Colors.white,
            onSurface: primaryTextColor,
            background: const Color(0xffFBFCFF),
            onBackground: primaryTextColor,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: primaryTextColor,
            titleSpacing: 32,
          ),
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: Colors.green,
          ),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.avenir)))),
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            subtitle1: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secondaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
            subtitle2: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secondaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            caption: const TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w700,
                color: Color(0xff7B8BB2)),
            headline6: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.bold,
              color: primaryTextColor,
              fontSize: 18,
            ),
            bodyText1: TextStyle(
              fontFamily: FontFamily.avenir,
              color: primaryTextColor,
              fontSize: 14,
            ),
            bodyText2: TextStyle(
              fontFamily: FontFamily.avenir,
              color: secondaryTextColor,
              fontSize: 15,
            ),
            headline4: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: primaryTextColor,
            ),
            headline5: TextStyle(
                fontFamily: FontFamily.avenir,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: primaryTextColor),
          )),
      // home: Stack(children: [
      //   Positioned.fill(child: HomeScreen()),
      //   Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation()),
      // ]),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;

const double bottomNavigationHeight = 65;

class _MainScreenState extends State<MainScreen> {
  int tabIndex = homeIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _articleKey = GlobalKey();
  final GlobalKey<NavigatorState> _searchKey = GlobalKey();
  final GlobalKey<NavigatorState> _menuKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _menuKey,
    menuIndex: _menuKey,
  };
  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[tabIndex]!.currentState!;
    
    if(currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    }else if(_history.isNotEmpty) {
      setState(() {
        tabIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeight,
              child: IndexedStack(
                index: tabIndex,
                children: [
                  _navigator(_homeKey, homeIndex, HomeScreen()),
                  _navigator(_articleKey, articleIndex, const Article()),
                  _navigator(_searchKey, searchIndex, const SearchScreen()),
                  _navigator(_menuKey, menuIndex, const ProfileScreen()),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomNavigation(
                onTap: (index) {
                  setState(() {
                    _history.remove(tabIndex);
                    _history.add(tabIndex);
                    tabIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && tabIndex !=index?Container():Navigator(
                  key: key,
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => Offstage(offstage: tabIndex != index, child: child),
                  ),
                );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;

  const _BottomNavigation({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: const Color(0xff9B8487).withOpacity(0.3),
                  )
                ],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ButtomNavigationItem(
                      iconFileName: "Home.png",
                      iconTitle: "Home",
                      activeIconFileName: "Home",
                      onTap: () {
                        onTap(homeIndex);
                      },
                    ),
                    _ButtomNavigationItem(
                      iconFileName: "Articles.png",
                      iconTitle: "Articles",
                      activeIconFileName: "Articles",
                      onTap: () {
                        onTap(articleIndex);
                      },
                    ),
                    Expanded(child: Container()),
                    _ButtomNavigationItem(
                      iconFileName: "Search.png",
                      iconTitle: "Search",
                      activeIconFileName: "Search",
                      onTap: () {
                        onTap(searchIndex);
                      },
                    ),
                    _ButtomNavigationItem(
                      iconFileName: "Menu.png",
                      iconTitle: "Menu",
                      activeIconFileName: "Menu",
                      onTap: () {
                        onTap(menuIndex);
                      },
                    ),
                  ]),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.5),
                    color: const Color(0xff376AED),
                    border: Border.all(color: Colors.white, width: 4)),
                child: Image.asset("assets/img/icons/plus.png"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ButtomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String iconTitle;
  final String activeIconFileName;
  final Function() onTap;

  const _ButtomNavigationItem(
      {Key? key,
      required this.iconTitle,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/icons/$iconFileName"),
            const SizedBox(
              height: 4,
            ),
            Text(
              iconTitle,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Screen',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
