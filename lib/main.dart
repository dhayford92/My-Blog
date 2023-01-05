import 'package:flutter/material.dart';
import 'package:myblog/utils/responsiveness.dart';

import 'pages/about.dart';
import 'pages/allposts.dart';
import 'pages/contact.dart';
import 'pages/homepage.dart';
import 'utils/footer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Blog',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {},
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    AllPostsPage(),
    AboutPage(),
    ContactPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 7,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: ResponsivenessControl.largeTabletLimit >=
                MediaQuery.of(context).size.width
            ? true
            : false,
        title: Text(
          'My Blog',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        actions: ResponsivenessControl.isDesktop(context)
            ? [
                menutabs(context, 'Home', 0, 90),
                menutabs(context, 'All Posts', 1, 110),
                menutabs(context, 'About Us', 2, 90),
                menutabs(context, 'Contact Us', 3, 110),
                const SizedBox(width: 90),
              ]
            : [],
      ),
      drawer: ResponsivenessControl.isDesktop(context)
          ? null
          : sideMenuDrawer(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              pages.elementAt(currentIndex),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  sideMenuDrawer(BuildContext context) {
    return Drawer(
      elevation: 8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 50),
            sideMenutabs(context, 'Home', 0),
            sideMenutabs(context, 'All Posts', 1),
            sideMenutabs(context, 'About Us', 2),
            sideMenutabs(context, 'Contact Us', 3),
          ],
        ),
      ),
    );
  }

  sideMenutabs(BuildContext context, String title, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 50,
        decoration: currentIndex == index
            ? const BoxDecoration(
                color: Colors.black,
              )
            : const BoxDecoration(),
        child: ListTile(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          hoverColor: Colors.white38,
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: currentIndex == index ? Colors.white : Colors.black54,
                  fontWeight:
                      currentIndex == index ? FontWeight.bold : FontWeight.w400,
                ),
          ),
        ),
      ),
    );
  }

  menutabs(BuildContext context, String title, int index, double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: width,
        height: 30,
        decoration: currentIndex == index
            ? const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
              )
            : const BoxDecoration(),
        child: ListTile(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          hoverColor: Colors.black38,
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: currentIndex == index ? Colors.black : Colors.black54,
                  fontWeight:
                      currentIndex == index ? FontWeight.bold : FontWeight.w400,
                ),
          ),
        ),
      ),
    );
  }
}
