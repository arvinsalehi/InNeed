class StoryData {
  final int id;
  final String name;
  final String imageFileName;
  final String iconFileName;
  final bool isViewed;

  StoryData(
      {required this.id,
      required this.name,
      required this.imageFileName,
      required this.iconFileName,
      required this.isViewed});
}

class Category {
  final int id;
  final String title;
  final String imageFileName;

  Category(
      {required this.id, required this.title, required this.imageFileName});
}

class PostData {
  final int id;
  final String caption;
  final String title;
  final String likes;
  final String time;
  final bool isBookmarked;
  final String imageFileName;

  PostData(
      {required this.id,
      required this.caption,
      required this.title,
      required this.likes,
      required this.time,
      required this.isBookmarked,
      required this.imageFileName});
}

class AppDatabase {
  static List<StoryData> get stories {
    return [
      StoryData(
          id: 1001,
          name: 'Hamed Esmaeilion',
          imageFileName: 'story_9.jpg',
          iconFileName: 'category_1.png',
          isViewed: false),
      StoryData(
          id: 1002,
          name: 'Nazanin Boniadi',
          imageFileName: 'story_10.jpg',
          iconFileName: 'category_2.png',
          isViewed: false),
      StoryData(
          id: 1003,
          name: 'Nasrin Sotoudeh',
          imageFileName: 'story_1.jpg',
          iconFileName: 'category_3.png',
          isViewed: true),
      StoryData(
          id: 1004,
          name: 'Masih Alinejad',
          imageFileName: 'story_3.jpg',
          iconFileName: 'category_1.png',
          isViewed: false),
      StoryData(
          id: 1005,
          name: 'Isabella',
          imageFileName: 'story_4.jpg',
          iconFileName: 'category_2.png',
          isViewed: false),
      StoryData(
          id: 1006,
          name: 'Olivia',
          imageFileName: 'story_6.jpg',
          iconFileName: 'category_1.png',
          isViewed: false),
      StoryData(
          id: 1007,
          name: 'Amelia',
          imageFileName: 'story_7.jpg',
          iconFileName: 'category_4.png',
          isViewed: false),
      StoryData(
          id: 1008,
          name: 'Grace',
          imageFileName: 'story_2.jpg',
          iconFileName: 'category_3.png',
          isViewed: false),
    ];
  }

  static List<Category> get categories {
    return [
      Category(
        id: 101,
        title: 'Political Prisoners',
        imageFileName: 'large_post_1.jpg',
      ),
      Category(id: 102, title: 'Missing', imageFileName: 'large_post_2.jpg'),
      Category(id: 103, title: 'Tortured', imageFileName: 'large_post_3.jpg'),
      Category(id: 104, title: 'Executed', imageFileName: 'large_post_4.jpg'),
      Category(
          id: 105, title: 'Children of War', imageFileName: 'large_post_5.jpg'),
      Category(id: 106, title: 'In Danger', imageFileName: 'large_post_6.jpg'),
      Category(id: 107, title: 'Killed', imageFileName: 'large_post_7.jpg'),
    ];
  }

  static List<PostData> get posts {
    return [
      PostData(
          id: 1,
          title: "Concerns about Toomaj Salehi's Health",
          caption: 'Victim of Torture',
          isBookmarked: false,
          likes: '3.1k',
          time: '1hr ago',
          imageFileName: 'small_post_1.jpg'),
      PostData(
          id: 0,
          title: 'Mohsen Shekari Executed 5am this morning',
          caption: 'Victim of Capital punishment',
          isBookmarked: false,
          likes: '1.2k',
          time: '2hr ago',
          imageFileName: 'small_post_2.jpg'),
      PostData(
          id: 2,
          title:
              'Germany parliment members sponserships of political prisoners of Iran',
          caption: 'Sponserships',
          isBookmarked: true,
          likes: '2k',
          time: '41hr ago',
          imageFileName: 'small_post_3.jpg'),
    ];
  }

  static List<OnBoardingItem> get OnBoardingItems {
    List<OnBoardingItem> items = [];
    items.add(OnBoardingItem(
        "See the status of people in need and be their voice",
        "This platform tries to extend the voice of people in need and update their status as soon as something happens so that we can help them by being their voice."));
    items.add(OnBoardingItem("Not a platform for political parties", "With freedom on our mind this platform is only for people in need and not for disscussing one's political side."));
    items.add(OnBoardingItem("Your Health matters!", "Here exists lots of graphic content and devistating news. So we recommend you to use the timer function of the app to maintain mental health."));
    return items;
  }
}

class OnBoardingItem {
  final String title;
  final String description;

  OnBoardingItem(this.title, this.description);
}
