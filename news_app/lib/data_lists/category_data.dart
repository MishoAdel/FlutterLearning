import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  final List<CategoryModel> catList = const [
    CategoryModel(imgPath: "assets/business.avif", name: "business"),
    CategoryModel(imgPath: "assets/entertaiment.avif", name: "entertainment"),
    CategoryModel(imgPath: "assets/general.avif", name: "general"),
    CategoryModel(imgPath: "assets/health.avif", name: "health"),
    CategoryModel(imgPath: "assets/science.avif", name: "science"),
    CategoryModel(imgPath: "assets/sports.avif", name: "sports"),
    CategoryModel(imgPath: "assets/technology.jpeg", name: "technology"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: catList.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryWidget(
          imagePath: catList[index].imgPath,
          name: catList[index].name,
        );
      },
    );
  }
}
