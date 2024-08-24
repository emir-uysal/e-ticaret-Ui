
import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  Icon icon;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

  categories.add(
    CategoryModel(
      name: "Kİ 1",
      icon: const Icon(Icons.abc),
      boxColor: const Color(0xffc58BF2)
      )
  );

  categories.add(
    CategoryModel(
      name: "Kİ 2",
      icon: const Icon(Icons.dangerous),
      boxColor: const Color(0xff92A3FD)
      )
    );

    categories.add(
    CategoryModel(
      name: "Kİ 3",
      icon: const Icon(Icons.back_hand),
      boxColor: const Color(0xffc58BF2)
      )
  );

  categories.add(
    CategoryModel(
      name: "Kİ 4",
      icon: const Icon(Icons.cabin),
      boxColor: const Color(0xff92A3FD)
      )
    );

    return categories;
  }

}