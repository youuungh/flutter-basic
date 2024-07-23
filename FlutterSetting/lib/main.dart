import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

const assetImagePath = 'assets/images';
const bannerImage = '$assetImagePath/banner.png';

void main() {
  runApp(
    MaterialApp(
      home: HomeWidget(),
    ),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter 라이브러리 및 로컬 데이터"),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Banner(),
        RandomWords()
      ],
    );
  }
}

class RandomWords extends StatelessWidget {
  const RandomWords({super.key});

  @override
  Widget build(BuildContext context) {
    final wordList = generateWordPairs().take(5).toList();
    final widgets = wordList
        .map(
          (word) => Text(
            // word.asString,
            word.asCamelCase,
            style: const TextStyle(fontSize: 32),
          ),
        )
        .toList();

    return Column(children: widgets);
  }
}

class Banner extends StatelessWidget {
  const Banner({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(bannerImage),
    );
  }
}

