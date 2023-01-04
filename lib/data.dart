class BlogPost {
  final String title;
  final String image;
  final String context;
  final String author;
  final String data;
  final List<String> category;

  BlogPost({
    required this.title,
    required this.image,
    required this.context,
    required this.author,
    required this.data,
    required this.category,
  });
}

String content =
    'Etiam ut tortor erat. Proin bibendum varius accumsan. Integer egestas, leo sit amet rhoncus efficitur, dolor justo feugiat ligula, non dapibus ligula lacus in est. Suspendisse scelerisque, augue ac eleifend mollis, magna ex viverra purus, vel varius augue felis at enim. Morbi non sagittis ex. Nunc venenatis nec tortor in efficitur. Quisque convallis sed diam sit amet pharetra. Duis at augue quis nunc dictum blandit. Sed sed rhoncus mauris, pulvinar dapibus sem. In ac fermentum magna, quis facilisis odio. Donec sollicitudin pretium lorem sed placerat.';
List<String> categories = [
  'All',
  'News',
  'Sport',
  'Games',
];
List<BlogPost> blogs = [
  BlogPost(
    title: 'Lorem ipsum dolor sit ame',
    image: 'assets/pic1.jpeg',
    context: content,
    author: 'Denzel hayford',
    data: '12/02/2023',
    category: ['Sport', 'Games', 'All'],
  ),
  BlogPost(
    title: 'Nam elementum interdum',
    image: 'assets/pic2.jpeg',
    context: content,
    author: 'Klain Sam',
    data: '12/02/2021',
    category: ['News', 'Games', 'All'],
  ),
  BlogPost(
    title: 'Nulla et ultricies purus. Aliquam quis ultricies lectus',
    image: 'assets/pic3.jpg',
    context: content,
    author: 'Christable Ohene',
    data: '12/02/2022',
    category: ['Sport', 'News', 'All'],
  ),
  BlogPost(
    title: 'Etiam ut tortor erat. Proin bibendum',
    image: 'assets/pic4.jpg',
    context: content,
    author: 'David Ampha',
    data: '24/01/2020',
    category: ['Sport'],
  ),
  BlogPost(
    title: 'Lorem ipsum dolor sit ame',
    image: 'assets/pic1.jpeg',
    context: content,
    author: 'Denzel hayford',
    data: '12/02/2023',
    category: ['Games', 'All'],
  ),
  BlogPost(
    title: 'Nam elementum interdum',
    image: 'assets/pic2.jpeg',
    context: content,
    author: 'Klain Sam',
    data: '12/02/2021',
    category: ['Sport', 'News', 'All'],
  ),
  BlogPost(
    title: 'Nulla et ultricies purus. Aliquam quis ultricies lectus',
    image: 'assets/pic3.jpg',
    context: content,
    author: 'Christable Ohene',
    data: '12/02/2022',
    category: ['News', 'All'],
  ),
  BlogPost(
    title: 'Etiam ut tortor erat. Proin bibendum',
    image: 'assets/pic4.jpg',
    context: content,
    author: 'David Ampha',
    data: '24/01/2020',
    category: ['Sport', 'Games', 'News', 'All'],
  ),
  BlogPost(
    title: 'Lorem ipsum dolor sit ame',
    image: 'assets/pic1.jpeg',
    context: content,
    author: 'Denzel hayford',
    data: '12/02/2023',
    category: ['Sport', 'Games', 'News', 'All'],
  ),
  BlogPost(
    title: 'Nam elementum interdum',
    image: 'assets/pic2.jpeg',
    context: content,
    author: 'Klain Sam',
    data: '12/02/2021',
    category: ['Sport', 'News', 'All'],
  ),
  BlogPost(
    title: 'Nulla et ultricies purus. Aliquam quis ultricies lectus',
    image: 'assets/pic3.jpg',
    context: content,
    author: 'Christable Ohene',
    data: '12/02/2022',
    category: ['Sport', 'Games', 'News', 'All'],
  ),
  BlogPost(
    title: 'Etiam ut tortor erat. Proin bibendum',
    image: 'assets/pic4.jpg',
    context: content,
    author: 'David Ampha',
    data: '24/01/2020',
    category: ['Sport', 'Games', 'News', 'All'],
  ),
];
