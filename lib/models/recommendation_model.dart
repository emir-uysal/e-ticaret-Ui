import 'package:flutter/material.dart';

class RecommendationModel {
  String name;
  Icon icon;
  String price;
  bool viewIsSelected;
  Color boxColor;

  RecommendationModel({
    required this.name,
    required this.icon,
    required this.price,
    required this.viewIsSelected,
    required this.boxColor,
  });

  static List<RecommendationModel> getRecommendations() {
    List<RecommendationModel> recommendations = [];

    recommendations.add(
      RecommendationModel(
        name: "ürün1",
        icon: Icon(Icons.add_box_outlined),
        price: "200 TL",
        viewIsSelected: true,
        boxColor: const Color(0xffc58BF2)
        ));

    recommendations.add(
      RecommendationModel(
        name: "ürün2",
        icon: Icon(Icons.add_link_sharp),
        price: "500 TL",
        viewIsSelected: false,
        boxColor: const Color(0xff92A3FD)
        ));

        recommendations.add(
      RecommendationModel(
        name: "ürün3",
        icon: Icon(Icons.kayaking),
        price: "200 TL",
        viewIsSelected: true,
        boxColor: const Color(0xffc58BF2)
        ));

        recommendations.add(
      RecommendationModel(
        name: "ürün4",
        icon: Icon(Icons.label),
        price: "500 TL",
        viewIsSelected: false,
        boxColor: const Color(0xff92A3FD)
        ));

        return recommendations;

  }

}