import 'package:flutter/material.dart';
import 'package:myblog/utils/responsiveness.dart';

import '../data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: ResponsivenessControl.isPhone(context) ? 300 : 500,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/home.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  'Time to Get Your Mind\nClean and in Order',
                  style: ResponsivenessControl.isPhone(context)
                      ? Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                          )
                      : Theme.of(context).textTheme.displayMedium!.copyWith(
                            color: Colors.white,
                          ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lacinia hendrerit turpis, vitae lacinia libero efficitur sed. Quisque varius congue turpis.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white54,
                      ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.blueGrey[600],
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Explore More'),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 360,
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: blogs.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  height: 350,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(blogs[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        blogs[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        blogs[index].context,
                        maxLines: 3,
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
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('Recent Added'),
          ),
          const SizedBox(height: 40 / 2),
          Container(
            width: MediaQuery.of(context).size.width,
            height: ResponsivenessControl.isPhone(context) ? 600 : 450,
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ResponsivenessControl.isPhone(context)
                          ? Column(
                              children: [
                                recentImages(index),
                                const SizedBox(height: 20),
                                content(index, context),
                              ],
                            )
                          : Row(
                              children: [
                                if (index == 0)
                                  Expanded(
                                    child: content(index, context),
                                  ),
                                const SizedBox(width: 20),
                                if (index == 0)
                                  Expanded(
                                    child: recentImages(index),
                                  ),
                                if (index == 1)
                                  Expanded(
                                    child: recentImages(index),
                                  ),
                                const SizedBox(width: 20),
                                if (index == 1)
                                  Expanded(
                                    child: content(index, context),
                                  ),
                              ],
                            ),
                    )),
          )
        ],
      ),
    );
  }

  recentImages(int index) {
    return SizedBox(
      height: ResponsivenessControl.isPhone(context) ? 100 : 200,
      width: ResponsivenessControl.isPhone(context)
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width,
      child: Image.asset(
        blogs[index].image,
        fit: BoxFit.cover,
      ),
    );
  }

  content(int index, BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            blogs[index].title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: ResponsivenessControl.isPhone(context)
                ? Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black)
                : Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black),
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            decoration: const BoxDecoration(
                border:
                    Border(left: BorderSide(width: 2, color: Colors.black))),
            child: ListTile(
              title: Text(
                blogs[index].author,
              ),
              subtitle: Text(
                blogs[index].data,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            blogs[index].context,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
