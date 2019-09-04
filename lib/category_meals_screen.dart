import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categories';
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeRags = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeRags['title'];
    final categoryId = routeRags['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle)
      ),
      body: Container(
        child: Text('The recipes for the Category'),
      ),
    );
  }
}
