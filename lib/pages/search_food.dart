import 'package:flutter/material.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class SearchFood extends StatefulWidget {
  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
   List<String> kFoods;
   CustomSearchDelegate _delegate;
URL urldomain=URL();

   _SearchFoodState() : kFoods = ['apple','mango','banana','orange','lays','eggs','oatmeal']
   ..sort((w1,w2) => w1.toLowerCase().compareTo(w2.toUpperCase()),),
   super();


 void checkinfo() async
  {
   try
   {
      
       var url="http://realbodies.com.au/api/food.php?f=get_food";
    final response=await http.get(url);
    print('Response body:${response.body}');
   var jsonResponse=json.decode(response.body);
     // var requestresponse=jsonResponse['response'];
  
    
     /*  if (requestresponse=="success")
{
 var image=urldomain.imgdomain.toString()+jsonResponse['image'];
  var name=jsonResponse['name'];
   var gender=jsonResponse['gender'];
    var old=jsonResponse['old'];
     var height=jsonResponse['height'];
      var weight=jsonResponse['weight'];

 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Desktop(image:image,name:name,gender:gender,old:old,height:height,weight:weight )),
  );
  }
else if(requestresponse=="error")
{

  print("error login");
} 

 */
   }
   catch(e)
   {
     print("Exception on way $e");
   }
  }

   @override
  void initState() {
     super.initState();
    // checkinfo();
     _delegate = CustomSearchDelegate(kFoods);
     checkinfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Palette.mainPurple,
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
         ),
       ],
     ),


      body:  Scrollbar(
    child: ListView.builder(
    itemCount: kFoods.length,
            itemBuilder: (context, idx) => ListTile(
              title: Text(kFoods[idx]),
            ),
    ),
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
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(  tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // SearchDelegate.close() can return vlaues, similar to Navigator.pop().
        this.close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('You have selected the word:'),
            GestureDetector (
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