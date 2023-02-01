import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  late SharedPreferences sharedPreferences;

  dates() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
          children: [
            Image.network("https://freedesignfile.com/upload/2019/11/E-commerce-cartoon-illustration-vector.jpg"),
            IntroductionScreen(
              pages: [
                PageViewModel(
                  // bodyWidget: Image.asset("assets/images/t1.jpg"),

                  image: Image.network(
                    "https://freedesignfile.com/upload/2019/11/E-commerce-cartoon-illustration-vector.jpg",
                    width: 350,
                  ),
                  title: "Discover",
                  body:
                  "Explore the world top brands and boutique",
                  decoration: PageDecoration(
                    titleTextStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                    bodyTextStyle: TextStyle(
                      fontSize: 16,
                    ),
                    pageColor: Colors.white,
                    imagePadding: EdgeInsets.all(24),
                  ),
                ),
                PageViewModel(
                  // bodyWidget: Image.asset("assets/images/t1.jpg"),

                  image: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU5LOrAu4dPJI-Po_gFABKUPDJ4LGs7sW329Uqdx9TRNE0KWZJxUKaKPIWNgoFsQkqqNk&usqp=CAU",
                    width: 350,
                  ),
                  title: "Make the Payment",
                  body:
                  "Chose the preferable option of payment",
                  decoration: PageDecoration(
                    titleTextStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                    bodyTextStyle: TextStyle(
                      fontSize: 16,
                    ),
                    pageColor: Colors.white,
                    imagePadding: EdgeInsets.all(24),
                  ),
                ),
                PageViewModel(
                  image: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm3KYoJuirJokWEgEKxtKBKDvwgwS1vDRv3XN_V_VNiI__eVkb1ldvgvHyK-L3-YXXnPw&usqp=CAU",
                    width: 350,
                  ),
                  title: "Enjoy your shopping",
                  body:
                  "Get high quality products for the best price",
                  decoration: PageDecoration(
                    titleTextStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                    bodyTextStyle: TextStyle(
                      fontSize: 16,
                    ),
                    pageColor: Colors.white,
                    imagePadding: EdgeInsets.all(24),
                  ),
                ),
              ],
              next: Text("Next"),
              showNextButton: true,
              done: Text("Done"),
              onDone: () {
                sharedPreferences.setBool('isIntroOver', true);
                Navigator.of(context).pushReplacementNamed("HomePage");
              },
              dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Theme.of(context).colorScheme.secondary,
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
              ),
              globalBackgroundColor: Colors.white,
            ),
          ],
        ),
    );
  }
}
