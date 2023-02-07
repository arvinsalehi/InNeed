import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth.dart';
import 'package:flutter_application_2/data.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter_application_2/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final onBoardingItems = AppDatabase.OnBoardingItems;

  int page = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Assets.img.background.onBoardingBackground
                    .image(fit: BoxFit.cover)),
          ),
        ),
        Container(
          height: 324,
          decoration: BoxDecoration(
              color: themeData.colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1)),
              ]),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        itemCount: onBoardingItems.length,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  onBoardingItems[index].title,
                                  style: themeData.textTheme.headline5,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  onBoardingItems[index].description,
                                  style: themeData.textTheme.subtitle1!
                                      .apply(fontSizeDelta: 0.1),
                                ),
                              ],
                            ),
                          );
                        })),
                Container(
                  height: 60,
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: onBoardingItems.length,
                        effect: ExpandingDotsEffect(
                            dotWidth: 10,
                            dotHeight: 10,
                            activeDotColor: themeData.colorScheme.primary,
                            dotColor:
                                themeData.colorScheme.primary.withOpacity(0.1)),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStateProperty.all(const Size(84, 60)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onPressed: (() {
                            if (page == onBoardingItems.length - 1) {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const AuthScreen()));
                            }
                            else {
                              _pageController.animateToPage(page+1, duration: const Duration(microseconds: 500), curve: Curves.decelerate);
                            }
                          }),
                          child: Icon(page != onBoardingItems.length - 1
                              ? CupertinoIcons.arrow_right
                              : CupertinoIcons.check_mark))
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
