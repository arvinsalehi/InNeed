import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/data.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';
import 'package:flutter_application_2/home.dart';
import 'package:flutter_application_2/utilities.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int tabIndex = 0;
  final posts = AppDatabase.posts;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: themeData.colorScheme.background.withOpacity(0),
                title: const Text("Profile"),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.more_horiz_rounded),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.1),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Assets.img.posts.large.largePost3.image(
                                    width: 84, height: 84, fit: BoxFit.cover),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("@NikaShakarami"),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Nika Shakarami",
                                      style: themeData.textTheme.bodyText1!
                                          .copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text("Deceased",
                                        style: themeData.textTheme.bodyText1!
                                            .apply(color: Colors.red)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                          child: Text(
                            'About',
                            style: themeData.textTheme.headline6,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                          child: Text(
                            truncate(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                length: 120),
                            style: themeData.textTheme.bodyText1!
                                .copyWith(fontWeight: FontWeight.w200),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 64,
                      left: 64,
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 30,
                              color: themeData.colorScheme.onBackground
                                  .withOpacity(0.5))
                        ]),
                      )),
                  Positioned(
                    bottom: 20,
                    left: 45,
                    right: 45,
                    child: Container(
                      height: 68,
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              style: tabIndex == 0
                                  ? ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          const Color(0xff2151CD)))
                                  : ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          themeData.colorScheme.primary)),
                              onPressed: () {
                                setState(() {
                                  tabIndex = 0;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '52',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "News",
                                    style: themeData.textTheme.bodyText1!.apply(
                                        color: themeData.colorScheme.onPrimary),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              style: tabIndex == 1
                                  ? ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          const Color(0xff2151CD)))
                                  : ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          themeData.colorScheme.primary)),
                              onPressed: () {
                                setState(() {
                                  tabIndex = 1;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '4.5m',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Followings",
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(
                                            color:
                                                themeData.colorScheme.onPrimary),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              style: tabIndex == 2
                                  ? ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          const Color(0xff2151CD)))
                                  : ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          themeData.colorScheme.primary)),
                              onPressed: () {
                                setState(() {
                                  tabIndex = 2;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '420',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Broadcast",
                                    style: themeData.textTheme.bodyText1!.apply(
                                        color: themeData.colorScheme.onPrimary),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(32, 0, 32, 64),
                decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          "News",
                          style: themeData.textTheme.headline6,
                        )),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.rectangle_grid_2x2,
                            color: themeData.colorScheme.primary,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.text_aligncenter,
                            color: themeData.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++) Post(post: posts[i], withImage: false,),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
