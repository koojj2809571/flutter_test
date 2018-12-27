import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Startup Name Generator", theme: new ThemeData(primaryColor: Colors.grey),home: new RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestionWords = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _save = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Startup Name Generator"),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
          ]),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestionWords.length) {
            _suggestionWords.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestionWords[index]);
        });
  }

  Widget _buildRow(WordPair suggestionWord) {
    final alreadySaved = _save.contains(suggestionWord);
    return new ListTile(
        title: new Text(suggestionWord.asPascalCase, style: _biggerFont),
        trailing: new Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _save.remove(suggestionWord);
            } else {
              _save.add(suggestionWord);
            }
          });
        });
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _save.map((pair) {
        return new ListTile(
          title: new Text(pair.asPascalCase, style: _biggerFont),
        );
      });
      final divided = ListTile.divideTiles(context: context, tiles: tiles).toList();
      return new Scaffold(
          appBar: new AppBar(title: new Text("Saved Suggestions")),
          body: new ListView(children: divided));
    }));
  }
}

void main() => runApp(new MyApp());
