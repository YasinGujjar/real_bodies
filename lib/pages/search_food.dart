import 'package:flutter/material.dart';

class SearchFood extends StatefulWidget {
  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
   List<String> kFoods;
   CustomSearchDelegate _delegate;

   _SearchFoodState() : kFoods = ['apple','mango','banana','Orange','lays','eggs']
   ..sort((w1,w2) => w1.toLowerCase().compareTo(w2.toUpperCase()),),
   super();

   @override
  void initState() {
    // TODO: implement initState
     super.initState();
     _delegate = CustomSearchDelegate(kFoods);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Search'),
       actions: <Widget>[
         IconButton(icon: Icon(Icons.search),    onPressed: () async {
           final String selected = await showSearch<String>(
             context: context,
             delegate: _delegate,
           );
           if (selected != null) {
             Scaffold.of(context).showSnackBar(
               SnackBar(
                 content: Text('You have selected the word: $selected'),
               ),
             );
           }
         },
         )
       ],
     ),


      body: Scrollbar(
    child: ListView.builder(
    itemCount: kFoods.length,
      itemBuilder: (context, idx) => ListTile(
        title: Text(kFoods[idx]),
      ),
    ),
    ),
      floatingActionButton: FloatingActionButton(
        //heroTag: "btn",
        onPressed: (){

//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => Exercise()),
//          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}



class CustomSearchDelegate extends SearchDelegate<String>{
  final List<String> _words;
  final List<String> _history;

  CustomSearchDelegate(List<String> words) : _words = words,
  _history = <String>[
    'apple',
    'Mango'
  ],
  super();


  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return <Widget>[
      query.isEmpty
          ? IconButton(
        tooltip: 'Voice Search',
        icon: const Icon(Icons.mic),
        onPressed: () {
          this.query = 'TODO: implement voice input';
        },
      )
          : IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(  tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // SearchDelegate.close() can return vlaues, similar to Navigator.pop().
        this.close(context, null);
      },);
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('You have selected the word:'),
            GestureDetector(
              onTap: () {
                // Returns this.query as result to previous screen, c.f.
                // `showSearch()` above.
                this.close(context, this.query);
              },
              child: Text(
                this.query,
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.startsWith(query));

    return _SuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

}


class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? Icon(Icons.history) : Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}