import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class WordState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WordState(),
      child: MaterialApp(
        title: 'MTBinh first app',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var _word = context.watch<WordState>();

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Text('Chữ ngẫu nhiên nà:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Text(_word.current.asLowerCase),
          IconButton(
            onPressed: () => {print('button pressed')},
            icon: const Icon(
              Icons.autorenew_rounded,
              color: Colors.deepOrange,
            ),
          ),
          TextButton(
            child: const Text('Hello'),
            onPressed: () {
              _word.getNext();
            },
          )
        ],
      )),
    );
  }
}
