import 'package:flutter/material.dart';
import 'package:recipe_list_app/model/recipe_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeScreen extends StatefulWidget {
  //This stateful widget page takes in String mealType and Recipe recipe
  final String mealType;
  final Recipe recipe;

  RecipeScreen({required this.mealType, required this.recipe});


  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  late final WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar is widget.mealType
      appBar: AppBar(
        title: Text(widget.mealType),
        backgroundColor: Color.fromARGB(255, 8, 155, 70),
      ),
      /**
       * Body is a Webview. Ensure you have imported webview flutter.
       *
       * initialUrl- spoonacularSourceUrl of our parsed in recipe
       * javascriptMode - set to unrestricted so as JS can load in the webview
       */
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(widget.recipe.spoonacularSourceUrl))
       ),
    );
  }
}