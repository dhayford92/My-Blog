import 'package:flutter/material.dart';
import 'package:myblog/utils/responsiveness.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
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
                'Contact Us',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 90),
            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 20),
            ResponsivenessControl.isDesktop(context) ||
                    ResponsivenessControl.islargetablet(context)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      contactInfo(context),
                      SizedBox(
                          width: ResponsivenessControl.islargetablet(context)
                              ? 20
                              : 50),
                      conatct()
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      contactInfo(context),
                      const SizedBox(height: 50),
                      conatct()
                    ],
                  ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Container conatct() {
    return Container(
      width: ResponsivenessControl.islargetablet(context) ? 350 : 400,
      height: 400,
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          contactTextFields('Full Name', 1, 45),
          contactTextFields('Phone Number', 1, 45),
          contactTextFields('Email Address', 1, 45),
          contactTextFields('Message', 3, 70),
          SizedBox(
            height: 40,
            child: MaterialButton(
              onPressed: () {},
              color: Colors.black,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Send',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  contactTextFields(String hint, int lng, int hgt) {
    return Container(
      width: ResponsivenessControl.islargetablet(context) ? 300 : 350,
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: TextField(
        maxLines: lng,
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 0, color: Colors.white),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 0, color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  contactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get In Touch With Us',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
        ),
        const SizedBox(height: 40),
        Text(
          'Nam elementum interdum aliquet. Nullam facilisis a \njusto vel eleifend. laoreet vel volutpat a, euismod id orci.\nlaoreet vel volutpat a, euismod id orci',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                letterSpacing: 1,
              ),
        ),
        const SizedBox(height: 30),
        contactItem(Icons.home_outlined, 'Our Location',
            'Greater Accra, Fise, \nOpposite Roka Int School'),
        const SizedBox(height: 30),
        contactItem(
            Icons.phone_android_outlined, 'Phone Number', '(+233) 24 020 9723'),
        const SizedBox(height: 30),
        contactItem(
            Icons.email_outlined, 'Email Address', 'dhayford92@gmail.com')
      ],
    );
  }

  contactItem(IconData icon, String header, String info) {
    return SizedBox(
      width: 400,
      height: 70,
      child: ListTile(
        leading: Container(
          width: 70,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blueGrey[800],
            borderRadius: BorderRadius.circular(7),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          header,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey[900],
              ),
        ),
        subtitle: Row(
          children: [
            const SizedBox(height: 30),
            Text(info,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
