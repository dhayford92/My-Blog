import 'package:flutter/material.dart';
import 'package:myblog/utils/responsiveness.dart';

import '../data.dart';

class AllPostsPage extends StatefulWidget {
  const AllPostsPage({super.key});

  @override
  State<AllPostsPage> createState() => _AllPostsPageState();
}

class _AllPostsPageState extends State<AllPostsPage> {
  int currentCategory = 0;
  String cats = '';

  List<BlogPost> searchposts = [];

  void searchBlog() {
    searchposts = [];
    if (cats.isNotEmpty) {
      for (var element in blogs) {
        for (var cat in element.category) {
          if (cat == categories[currentCategory]) {
            setState(() {
              searchposts.add(element);
            });
          }
        }
      }
    } else {
      setState(() {
        searchposts = blogs;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    searchBlog();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/home.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              'All Posts',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          ResponsivenessControl.isPhone(context)
              ? Column(
                  children: [
                    categorytabs(),
                    const SizedBox(height: 15),
                    postItems(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: categorytabs(),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      flex: 5,
                      child: postItems(),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  postItems() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 600,
        child: GridView.builder(
          itemCount: searchposts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: ResponsivenessControl.isPhone(context)
                  ? 1.4
                  : ResponsivenessControl.islargetablet(context)
                      ? 1
                      : 0.8,
              crossAxisCount: ResponsivenessControl.isDesktop(context)
                  ? 4
                  : ResponsivenessControl.isPhone(context)
                      ? 1
                      : 2),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              height: ResponsivenessControl.isPhone(context) ? 300 : 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: ResponsivenessControl.isPhone(context) ? 100 : 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(searchposts[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    searchposts[index].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ResponsivenessControl.isDesktop(context)
                        ? Theme.of(context).textTheme.titleLarge
                        : Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    searchposts[index].context,
                    maxLines: ResponsivenessControl.isPhone(context) ? 2 : 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.black,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Read More',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  categorytabs() {
    return Card(
      elevation: 8,
      shadowColor: Colors.black,
      child: SizedBox(
        height: ResponsivenessControl.isPhone(context) ? 40 : 200,
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: ResponsivenessControl.isPhone(context)
              ? Axis.horizontal
              : Axis.vertical,
          itemBuilder: (context, index) => SizedBox(
            width: ResponsivenessControl.isPhone(context)
                ? 100
                : MediaQuery.of(context).size.width,
            child: ListTile(
              selectedColor: Colors.black,
              selectedTileColor: Colors.black,
              selected: currentCategory == index ? true : false,
              onTap: () {
                setState(() {
                  currentCategory = index;
                  cats = categories[index];
                });
                searchBlog();
              },
              title: Text(
                categories[index],
                style: TextStyle(
                  color: currentCategory == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
