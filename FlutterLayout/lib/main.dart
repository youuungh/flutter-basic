import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeWidget(),
  ));
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: ConstraintsWidget(),
    ));
  }
}

class ConstraintsWidget extends StatelessWidget {
  const ConstraintsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded( 
          child: Container(
              color: Colors.blue,
              child: Text(
                'Hello world! Hello world! Hello world! Hello world!Hello world! Hello world!Hello world! Hello world!Hello world! Hello world!Hello world! Hello world!',
                style: TextStyle(fontSize: 30),
              )),
        ),
        Expanded(
          child: Container(
              color: Colors.red,
              child: Text(
                'Hello world!',
                style: TextStyle(fontSize: 30),
              )),
        ),
      ],
    );
  }
}

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Widget 배치하기"),
//         ),
//         body: Body(),
//       ),
//     ),
//   );
// }

// return Container(
// height: 300,
// width: double.infinity,
// color: Colors.grey,
// child: Column(
// mainAxisSize: MainAxisSize.max,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 100,
// height: 80,
// color: Colors.red,
// child: Text('Container 1'),
// ),
// Container(
// width: 100,
// height: 80,
// color: Colors.green,
// child: Text('Container 2'),
// ),
// Container(
// width: 100,
// height: 80,
// color: Colors.blue,
// child: Text('Container 3'),
// ),
// ],
// ),
// );

// return Container(
// height: double.infinity,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 100,
// height: 80,
// color: Colors.red,
// child: Text('Container 1'),
// ),
// Container(
// width: 100,
// height: 80,
// color: Colors.green,
// child: Text('Container 2'),
// ),
// Container(
// width: 100,
// height: 80,
// color: Colors.blue,
// child: Text('Container 3'),
// ),
// ],
// ),
// );

// Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.end,
// children: [
// Container(
// width: 100,
// height: 80,
// color: Colors.red,
// child: Text('Container 1'),
// ),
// Container(
// width: 100,
// height: 80,
// color: Colors.green,
// child: Text('Container 2'),
// ),
// Container(
// width: 100,
// height: 80,
// color: Colors.blue,
// child: Text('Container 3'),
// ),
// ],
// ),
// Container(
// width: 300,
// height: 120,
// color: Colors.grey,
// child: Text('Container 4'),
// )

/**
 * ScrollView
 */

// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Container(
// color: Colors.grey,
// width: double.infinity,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: double.infinity,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: double.infinity,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: double.infinity,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: double.infinity,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: double.infinity,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: double.infinity,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: double.infinity,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// ],
// ),

// return SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Container(
// color: Colors.grey,
// width: 100,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: 100,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: 100,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: 100,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: 100,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: 100,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: 100,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// Container(
// color: Colors.grey,
// width: 100,
// height: 100,
// margin: EdgeInsets.symmetric(horizontal: 8),
// ),
// ],
// ),
// );

/**
 *  비율
 */

// return Column(
// children: [
// Container(width: double.infinity, height: 200, color: Colors.red,),
// Expanded(child: Container(color: Colors.blue, height: 100,)),
// Flexible(flex: 1, child: Container(color: Colors.red, height: 100,)),
// // Flexible(flex: 2, child: Container(color: Colors.blue)),
// // Flexible(flex: 3, child: Container(color: Colors.green)),
// // Flexible(flex: 4, child: Container(color: Colors.yellow)),
// ],
// );

// Row(
// children: [
// Container(width: 50, height: 200, color: Colors.red,),
// Expanded(child: Container(color: Colors.blue, width: 100,)),
// Flexible(flex: 1, child: Container(color: Colors.red, width: 100,)),
// // Flexible(flex: 2, child: Container(color: Colors.blue)),
// // Flexible(flex: 3, child: Container(color: Colors.green)),
// // Flexible(flex: 4, child: Container(color: Colors.yellow)),
// ],
// );

// return Column(
// children: [
// Container(
// width: 100,
// height: 100,
// color: Colors.red,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Expanded(
// child: Container(
// width: 100,
// height: 100,
// color: Colors.red,
// margin: const EdgeInsets.symmetric(vertical: 8),
// child: SingleChildScrollView(
// child: Column(
// children: [
// Container(
// color: Colors.blue,
// height: 50,
// width: 50,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// color: Colors.blue,
// height: 50,
// width: 50,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// color: Colors.blue,
// height: 50,
// width: 50,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// color: Colors.blue,
// height: 50,
// width: 50,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// color: Colors.blue,
// height: 50,
// width: 50,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// color: Colors.blue,
// height: 50,
// width: 50,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// color: Colors.blue,
// height: 50,
// width: 50,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// color: Colors.blue,
// height: 50,
// width: 50,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// color: Colors.blue,
// height: 50,
// width: 50,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// color: Colors.blue,
// height: 50,
// width: 50,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// color: Colors.blue,
// height: 50,
// width: 50,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// color: Colors.blue,
// height: 50,
// width: 50,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// ],
// ),
// ),
// ),
// ),
// Container(
// width: 100,
// height: 100,
// color: Colors.red,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// width: 100,
// height: 100,
// color: Colors.red,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// width: 100,
// height: 100,
// color: Colors.red,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// Container(
// width: 100,
// height: 100,
// color: Colors.red,
// margin: const EdgeInsets.symmetric(vertical: 8),
// ),
// ],
// );

// Container(
// width: 500,
// height: 500,
// color: Colors.black,
// ),
// Container(
// width: 400,
// height: 400,
// color: Colors.red,
// ),
// Container(
// width: 300,
// height: 300,
// color: Colors.blue,
// ),
// Align(
// alignment: Alignment(0.5, -0.5),
// child: Container(
// width: 200,
// height: 200,
// color: Colors.green,
// ),
// ),

// return Stack(
// children: [
// Align(
// alignment: Alignment.center,
// child: Container(
// width: 300,
// height: 300,
// decoration: BoxDecoration(
// color: Colors.red,
// borderRadius: BorderRadius.circular(150),
// ),
// ),
// ),
// Align(
// alignment: Alignment.center,
// child: Container(
// width: 280,
// height: 280,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(150),
// ),
// ),
// ),
// Align(
// alignment: Alignment.center,
// child: Text(
// 'Count 0',
// style: TextStyle(color: Colors.red, fontSize: 32),
// ),
// )
// ],
// );

// return Container(
// height: 500,
// width: 500,
// color: Colors.blue,
// child: Center(
// // child: Container(
// //   constraints: BoxConstraints.loose(Size(200, 200)),
// //   // height: 300,
// //   // width: 300,
// //   color: Colors.red,
// //   // padding: const EdgeInsets.all(8),
// //   child: Container(
// //     margin: const EdgeInsets.all(20),
// //     width: 50,
// //     height: 50,
// //     color: Colors.green,
// //   ),
// // ),
//
// child: OverflowBox(
// child: Container(
// width: 300,
// height: 700,
// color: Colors.green,
// ),
// ),
// ),
// );
