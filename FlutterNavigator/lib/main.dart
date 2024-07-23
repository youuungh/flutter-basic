import 'package:flutter/material.dart';
import 'package:flutter_navigator/screen/new_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: GoRouter(initialLocation: '/', routes: [
        GoRoute(
            path: '/',
            name: 'home',
            builder: (context, _) => const HomeWidget()),
        GoRoute(
          path: '/new',
          name: 'new',
          builder: (context, _) => const NewPage()),
        GoRoute(
            path: '/new1',
            name: 'new1',
            builder: (context, _) => const NewPage2())
      ]),
    ),
  );
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Navigator'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Go to Page'),
          onPressed: () {
            context.pushNamed('new');
          },
        ),
      ),
    );
  }
}

// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key});
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   late int index;
//
//   @override
//   void initState() {
//     index = 0;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Navigator'),
//       ),
//       body: homeBody(),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User')
//         ],
//         currentIndex: index,
//         onTap: (newIndex) => setState(() {
//           index = newIndex;
//         }),
//       ),
//     );
//   }
//
//   Widget homeBody() {
//     switch (index) {
//       case 1:
//         return const Center(
//           child: Icon(Icons.search, size: 100),
//         );
//       case 2:
//         return const Center(
//           child: Icon(Icons.person, size: 100),
//         );
//       case 0:
//       default:
//         return const Center(
//           child: Icon(Icons.home, size: 100),
//         );
//     }
//   }
// }

// void main() {
//   runApp(
//     const MaterialApp(
//       home: HomeWidget(),
//     ),
//   );
// }
//
// class HomeWidget extends StatefulWidget {
//   const HomeWidget({super.key});
//
//   @override
//   State<HomeWidget> createState() => _HomeWidgetState();
// }
//
// class _HomeWidgetState extends State<HomeWidget> {
//   late int index;
//
//   @override
//   void initState() {
//     index = 0;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Navigator'),
//       ),
//       body: Center(
//         child: TextButton(
//           child: const Text('Go to Page'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const NewPage(),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
