import 'package:flutter/material.dart';
import 'package:myblog/utils/responsiveness.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
              'About Us',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: ResponsivenessControl.isPhone(context) ? 600 : 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  child: Text(
                    'Why Us?',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 8),
                  child: Text(
                    'Nam elementum interdum aliquet. Nullam facilisis a justo vel eleifend. Maecenas arcu elit, laoreet vel volutpat a, euismod id orci. \nCurabitur sagittis sapien a orci aliquam, et efficitur risus porttitor.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 60),
                ResponsivenessControl.isPhone(context)
                    ? Column(
                        children: [
                          otherInfo(context),
                          const SizedBox(height: 20),
                          otherInfo(context),
                          const SizedBox(height: 20),
                          otherInfo(context)
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          otherInfo(context),
                          const SizedBox(width: 20),
                          otherInfo(context),
                          const SizedBox(width: 20),
                          otherInfo(context)
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column otherInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          'Nullam facilisis',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          'Nullam facilisis Nam elementum interdum aliquet. \nNullam facilisis a justo vel eleifend. \nMaecenas arcu elit, \nlaoreet vel volutpat a, euismod id orci.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
