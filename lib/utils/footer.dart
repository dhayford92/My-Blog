import 'package:flutter/material.dart';
import 'package:myblog/utils/responsiveness.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 190,
      color: Colors.black,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Let Connect',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white54, letterSpacing: 1.5),
          ),
          ResponsivenessControl(
            desktop: subtxtbtn(context),
            largetablet: subtxtbtn(context),
            tablet: subtxtbtn(context),
            phone: psubtxtbtn(context),
          ),
          Text(
            'Build By Denzel Hayford',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white54),
          ),
        ],
      ),
    );
  }

  subtxtbtn(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 200,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 400,
            child: const TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'subscribe here',
                enabledBorder: OutlineInputBorder(),
              ),
            ),
          ),
          addBtn(context)
        ],
      ),
    );
  }

  psubtxtbtn(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      height: 110,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: const TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'subscribe here',
                enabledBorder: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          addBtn(context)
        ],
      ),
    );
  }

  addBtn(BuildContext context) {
    return SizedBox(
      width: ResponsivenessControl.isPhone(context) ? 150 : 200,
      height: ResponsivenessControl.isPhone(context)
          ? 40
          : MediaQuery.of(context).size.height,
      child: MaterialButton(
        onPressed: () {},
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: ResponsivenessControl.isPhone(context)
              ? BorderRadius.circular(9)
              : BorderRadius.circular(20),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Add'),
        ),
      ),
    );
  }
}
