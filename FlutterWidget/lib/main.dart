import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Study to Container'),
        ),
        body: CustomContainer(),
      ),
    ),
  );
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
        // margin: EdgeInsets.symmetric(vertical: 24, horizontal: 30),
        decoration: BoxDecoration(
            color: Colors.blue.shade200, // Color(0xff85d07b)
            border: Border.all(color: Colors.black, width: 5, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(80),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.3), offset: Offset(6, 6), blurRadius: 10, spreadRadius: 10),
              BoxShadow(color: Colors.grey.withOpacity(0.3), offset: Offset(-6, -6), blurRadius: 10, spreadRadius: 10)
            ]
        ),
        child: Center(child: Container(
            color: Colors.yellow,
            child: Text('This is Container'))),
      ),
    );
  }
}


// appBar: AppBar(
// actions: [
// IconButton(
// icon: Icon(Icons.home),
// onPressed: () {
// print('Tab');
// },
// ),
// Icon(Icons.play_arrow)
// ],
// centerTitle: false,
// title: Text('This is App bar'),
// ),
// body: TestWidget(),
// floatingActionButton: FloatingActionButton(
// child: Icon(Icons.bug_report),
// onPressed: () {
// print('Tab fab');
// },
// ),

// class TestWidget extends StatelessWidget {
//   const TestWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Center(
//         child: Text(
//           'Hello, Flutter!',
//           style: TextStyle(fontSize: 30, color: Colors.black),
//         ),
//       ),
//     );
//   }
// }
