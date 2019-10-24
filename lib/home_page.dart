import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:xiaohou/details.dart';


class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    var scaffold = new Scaffold (
      appBar: new AppBar(
        title: new Text('choose your taste'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
    return scaffold;
  }
  final _suggestions = <WordPair>[];   // array
  final _saved = new Set<WordPair>();    // 收藏合集 （去重）
  final _biggerFont = const TextStyle(
    fontSize: 18.0,
  );
    void _pushSaved() {
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) {
            final tiles = _saved.map(
              (pair) {
                return new ListTile(
                  title: new Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                  leading: Image.network('https://c-ssl.duitang.com/uploads/item/201410/11/20141011193525_xjiE8.thumb.1400_0.jpeg'),
                  onTap: () => 
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return personDetails();
                    })
                  ),
                );
              },
            );
            final divided = ListTile
              .divideTiles(
                context: context,
                tiles: tiles,
              )
              .toList();

            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Saved person'),
              ),
              body: new ListView(
                children: divided,
              ),
              floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.navigate_next),
                  // onPressed: () =>
                  //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => UnderPage())),
              ),
            );
          },
        ),
      );
    }
    Widget _buildSuggestions() {
      return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
      );
    }
    Widget _buildRow(WordPair pair) {
      final alreadySaved = _saved.contains(pair);
      var asPascalCase = pair.asPascalCase;
      return new ListTile(
        title: new Text(
          asPascalCase,
          style: _biggerFont,
        ),
        leading: Image.network('https://c-ssl.duitang.com/uploads/item/201410/11/20141011193525_xjiE8.thumb.1400_0.jpeg'),
        trailing: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        },
      );
    }
}

