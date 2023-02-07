import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';

class Article extends StatefulWidget {
  const Article({super.key});

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  bool bookedMark = false;
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: Container(
        width: 111,
        height: 50,
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: themeData.colorScheme.primary.withOpacity(0.5))
          ],
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              liked = !liked;
            });
          },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  liked
                      ? CupertinoIcons.hand_thumbsup_fill
                      : CupertinoIcons.hand_thumbsup,
                  color: liked ? Colors.red : themeData.colorScheme.onPrimary,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '20.1k',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: themeData.colorScheme.onPrimary),
                ),
              ]),
        ),
      ),
      backgroundColor: themeData.colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                title: const Text("Updates"),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded)),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Text(
                      'Morality police brutality on yet another victim.',
                      style: themeData.textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Assets.img.posts.small.profile1
                              .image(width: 48, height: 48, fit: BoxFit.cover),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Niloofar Hamedi",
                                style: themeData.textTheme.bodyText1!
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text("100d ago"),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showSnackBar(context, "Content Shared");
                            },
                            icon: Icon(CupertinoIcons.share,
                                color: themeData.colorScheme.primary)),
                        const SizedBox(
                          width: 2,
                        ),
                        IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  bookedMark = !bookedMark;
                                  showSnackBar(
                                      context,
                                      bookedMark
                                          ? "archived"
                                          : "Removed form archive");
                                },
                              );
                            },
                            icon: Icon(
                              bookedMark
                                  ? CupertinoIcons.bookmark_fill
                                  : CupertinoIcons.bookmark,
                              color: themeData.colorScheme.primary,
                            )),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                    child: Assets.img.posts.large.post1.image(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                    child: Text(
                      "Mahsa Amini was Killed from a hit to the Head by morality police",
                      style: themeData.textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 80),
                    child: Text(
                      "On 16 September 2022, the 22-year-old Iranian woman Mahsa Amini,also known as Jina Amini, died in a hospital in Tehran, Iran, under suspicious circumstances. The Guidance Patrol, the religious morality police of Iran's government, arrested Amini for allegedly not wearing the hijab in accordance with government standards. The Law Enforcement Command of the Islamic Republic of Iran stated that she had a heart attack at a police station, collapsed, and fell into a coma before being transferred to a hospital. However, eyewitnesses, including women who were detained with Amini, reported that she was severely beaten and that she died as a result of police brutality, which was denied by the Iranian authorities.[9] The assertions of police brutality, in addition to leaked medical scans,[10] led some observers to believe Amini had a cerebral hemorrhage or stroke due to head injuries received after her arrest.",
                      style: themeData.textTheme.bodyText2,
                    ),
                  )
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                  themeData.colorScheme.surface,
                  themeData.colorScheme.surface.withOpacity(0)
                ])
              ),
            ),
          )
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.fixed,
      duration: Duration(milliseconds: 500),
    ));
  }
}
