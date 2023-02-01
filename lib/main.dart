// import 'package:flutter/material.dart';
// import 'package:intro_screen_app/views/screens/homepage.dart';
//
// import 'global.dart';
//
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     routes: {
//       "/": (context) => Homepage(),
//       "HomePage": (context) => HomePage(),
//     },
//   ));
// }
//
// class Homepage extends StatefulWidget {
//   const Homepage({super.key});
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//
//   int index = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //   children: [
//                 //     Row(
//                 //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //       children:[ ...introduction
//                 //           .map(
//                 //             (e) => Padding(
//                 //               padding: const EdgeInsets.all(8.0),
//                 //               child: Container(
//                 //                 height: 10,
//                 //                 width: 10,
//                 //                 decoration: BoxDecoration(
//                 //                     color: Colors.black,
//                 //                     borderRadius: BorderRadius.circular(10)),
//                 //               ),
//                 //             ),
//                 //           )
//                 //           .toList(),
//                 //           SizedBox(width: 200,),
//                 //           Container(
//                 //             alignment: Alignment.center,
//                 //             height: 40,width: 100,
//                 //             decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
//                 //             color: Colors.blue,
//                 //           ),
//                 //           child: Text("Skip"),
//                 //             )
//                 //           ],
//                 //     ),
//                 //   ],
//                 // ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, "home");
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         height: 40,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           border: Border.all(width: 1,color: Colors.black),
//                           color: Colors.white,
//                         ),
//                         child: Text("Skip",style: TextStyle(color: Colors.black),),
//                       ),
//                     )
//                   ],
//                 ),
//                 Expanded(
//                   flex: 10,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "${Alldetails[index]['name']}",
//                         style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 26,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "${Alldetails[index]['des']}",
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       Container(
//                         height: 200,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: NetworkImage(
//                                     "${Alldetails[index]['image']}"))),
//                       )
//                     ],
//                   ),
//                 ),
//                 // const SizedBox(
//                 //   height: 150,
//                 // ),
//                 Expanded(
//                   flex: 1,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             if (index < 2) {
//                               index++;
//                             } else {
//                               Navigator.pushNamed(context, 'HomePage');
//                             }
//                             if (index > 2) {
//                               index == 2;
//                             }
//                           });
//                         },
//                         style: ButtonStyle(
//                           shape: MaterialStateProperty.all(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           backgroundColor:
//                           MaterialStateProperty.all(Colors.black),
//                         ),
//                         child: const Text(
//                           "Next",
//                           style: TextStyle(color: Colors.white, fontSize: 18),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const Spacer(
//                   flex: 1,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         backgroundColor: Colors.white,
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:intro_screen_app/views/screens/All_intro_screen.dart';
import 'package:intro_screen_app/views/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isIntroOver = prefs.getBool('isIntroOver') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isIntroOver == true) ? 'HomePage' : '/',
      routes: {
        '/' : (context) =>   IntroScreen(),
        'HomePage' : (context) => HomePage(),
      },
    ),
  );
}