import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/article.dart';
import 'package:flutter_application_2/carousel/carousel_slider.dart';
import 'package:flutter_application_2/gen/fonts.gen.dart';
import 'package:flutter_application_2/utilities.dart';

import 'data.dart';
import 'gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final stories = AppDatabase.stories;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    Timer(const Duration(milliseconds: 5), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values); // to re-show bars
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 20, 32, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi, Arvin!',
                        style: themeData.textTheme.subtitle1,
                      ),
                      Assets.img.icons.notification.image(
                        width: 32,
                        height: 32,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 10, 0, 24),
                  child: Text(
                    "Explore today's",
                    style: themeData.textTheme.headline4,
                  ),
                ),
                _StoryList(stories: stories),
                const SizedBox(
                  height: 16,
                ),
                const _CategoryList(),
                const _PostList(),
              ],
            )),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          return _CategoryItem(
            category: categories[realIndex],
            left: realIndex == 0 ? 32 : 8,
            right: realIndex == categories.length - 1 ? 32 : 8,
          );
        },
        options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            aspectRatio: 1.4,
            initialPage: 0,
            disableCenter: true,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            scrollPhysics: const BouncingScrollPhysics(),
            enlargeStrategy: CenterPageEnlargeStrategy.height));
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  final double left;
  final double right;
  const _CategoryItem({
    Key? key,
    required this.category,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
              top: 100,
              right: 65,
              left: 65,
              bottom: 24,
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0xaa0D253C),
                  )
                ]),
              )),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(32)),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Color(0xff0D253C),
                      Colors.transparent,
                    ],
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 32,
              left: 32,
              child: Text(
                category.title,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .apply(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    Key? key,
    required this.stories,
  }) : super(key: key);

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: stories.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          itemBuilder: (context, index) {
            final story = stories[index];
            return _Story(story: story);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(children: [
            story.isViewed ? _profileImageSeen() : _profileImageUnSeen(),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/img/icons/${story.iconFileName}",
                width: 28,
                height: 28,
              ),
            )
          ]),
          const SizedBox(
            height: 8,
          ),
          Text(
            truncate(story.name, length: 7),
            style: Theme.of(context).textTheme.bodyText2,
          )
        ],
      ),
    );
  }

  Widget _profileImageUnSeen() {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(begin: Alignment.topRight, colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB),
          ])),
      child: Container(
        margin: const EdgeInsets.all(2.9),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(3),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageSeen() {
    return SizedBox(
      width: 80,
      height: 80,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: const Radius.circular(24),
        dashPattern: const [8, 3],
        color: const Color(0xff7b8bb2),
        padding: const EdgeInsets.all(3),
        child: Container(
          margin: const EdgeInsets.all(3.2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  ClipRRect _profileImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "assets/img/stories/${story.imageFileName}",
          height: 80,
          fit: BoxFit.cover,
        ));
  }
}

class _PostList extends StatelessWidget {
  const _PostList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 24, top: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest News",
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(onPressed: () => {}, child: const Text("More"))
            ],
          ),
        ),
        ListView.builder(
            itemCount: posts.length,
            itemExtent: 141,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: ((context, index) {
              final post = posts[index];
              return Post(post: post);
            }))
      ],
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    Key? key,
    required this.post,
    this.withImage=true,
  }) : super(key: key);

  final PostData post;
  final bool withImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Article(),));
      },
      child: Container(
        height: withImage?149:100,
        margin: const EdgeInsets.fromLTRB(32, 8, 8, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Color(0x1a5282FF),
            ),
          ],
        ),
        child: Row(
          children: withImage?[
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Positioned.fill(
                  child: Image.asset(
                'assets/img/posts/small/${post.imageFileName}',
                height: 149,
                width: 125,
                fit: BoxFit.cover,
              )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      truncate(post.caption),
                      style: const TextStyle(
                        fontFamily: FontFamily.avenir,
                        color: Color(0xff376AED),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(truncate(post.title),
                        style: Theme.of(context).textTheme.subtitle2),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          CupertinoIcons.hand_thumbsup,
                          size: 20,
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          post.likes,
                          style: Theme.of(context).textTheme.bodyText2!,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Icon(
                          CupertinoIcons.clock,
                          size: 20,
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          post.time,
                          style: Theme.of(context).textTheme.bodyText2!,
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 16),
                            alignment: Alignment.centerRight,
                            child: Icon(
                              post.isBookmarked
                                  ? CupertinoIcons.bookmark_fill
                                  : CupertinoIcons.bookmark,
                              size: 20,
                              color: Theme.of(context).textTheme.bodyText2!.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ]:[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      truncate(post.caption),
                      style: const TextStyle(
                        fontFamily: FontFamily.avenir,
                        color: Color(0xff376AED),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(truncate(post.title),
                        style: Theme.of(context).textTheme.subtitle2),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          CupertinoIcons.hand_thumbsup,
                          size: 20,
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          post.likes,
                          style: Theme.of(context).textTheme.bodyText2!,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Icon(
                          CupertinoIcons.clock,
                          size: 20,
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          post.time,
                          style: Theme.of(context).textTheme.bodyText2!,
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 16),
                            alignment: Alignment.centerRight,
                            child: Icon(
                              post.isBookmarked
                                  ? CupertinoIcons.bookmark_fill
                                  : CupertinoIcons.bookmark,
                              size: 20,
                              color: Theme.of(context).textTheme.bodyText2!.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}

