import 'package:flutter/material.dart';
import 'package:news_app/views/category_view.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {required this.imagePath, required this.name, super.key});

  final String imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(
                category: name,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          width: 160,
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
              child: Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
