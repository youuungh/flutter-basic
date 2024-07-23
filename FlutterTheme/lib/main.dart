import 'package:flutter/material.dart';
import 'package:flutter_theme/style/theme.dart';

void main() {
  runApp(
    MaterialApp(
        home: const HomeWidget(),
        theme: customTheme
    ),
  );
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Theme'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Press count', style: textTheme.bodyLarge),
            Text(
              '$count',
              style: textTheme.displayLarge,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
      ),
    );
  }
}
