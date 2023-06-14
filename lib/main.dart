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
    var word = context.watch<WordState>();
    var wordFormatted = word.current.asLowerCase;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages'),
              // visualDensity: const VisualDensity(vertical: -2),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages 2'),
              // visualDensity: const VisualDensity(vertical: -2),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Hi'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Chữ ngẫu nhiên nà: ', style: TextStyle(fontSize: 20)),
              Text(wordFormatted,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          IconButton(
            onPressed: () {
              word.getNext();
            },
            icon: const Icon(
              Icons.autorenew_rounded,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}
