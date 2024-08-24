import 'package:flutter/material.dart';

class PopularModel {
  String name;
  Icon icon;
  String price;
  bool boxIsSelected;

  PopularModel({
    required this.name,
    required this.icon,
    required this.price,
    required this.boxIsSelected
  });

  static List<PopularModel> getPopular() {
    List<PopularModel> popular = [];

    popular.add(
      PopularModel(
        name: "ürün1",
        icon: Icon(Icons.add_box_outlined),
        price: "200 TL",
        boxIsSelected: true,
        ));

    popular.add(
      PopularModel(
        name: "ürün2",
        icon: Icon(Icons.add_link_sharp),
        price: "500 TL",
        boxIsSelected: false,
      ));

      return popular;
  }
}