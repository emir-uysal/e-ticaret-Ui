import 'package:e_ticaret_ui_ornek/models/category_model.dart';
import 'package:e_ticaret_ui_ornek/models/popular_model.dart';
import 'package:e_ticaret_ui_ornek/models/recommendation_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryModel> categories = [];
  List<RecommendationModel> recommendations = [];
  List<PopularModel> popular = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    recommendations = RecommendationModel.getRecommendations();
    popular = PopularModel.getPopular();
  }


  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(height: 40,),
          _categoriesSection(),
          const SizedBox(height: 40,),
          _recommendationSection(),
          const SizedBox(height: 40,),
          _popularSection(),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }

  Column _popularSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Popüler",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 15,),
            ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: 115,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      popular[index].icon,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            popular[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16
                            ),
                          ),
                          Text(
                            popular[index].price,
                            style: const TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: popular[index].boxIsSelected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: popular[index].boxIsSelected ? [
                      BoxShadow(
                        color: const Color(0xff1D1617).withOpacity(0.07),
                        offset: const Offset(0, 10),
                        blurRadius: 40,
                        spreadRadius: 0
                      )
                    ] : []
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 25,),
              itemCount: popular.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              ),
          ],
        );
  }

  Column _recommendationSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Recommendation",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 240,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: recommendations[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        recommendations[index].icon,
                        Text(
                          recommendations[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16
                          ),
                          ),
                          Text(
                            recommendations[index].price,
                            style: const TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 130,
                            child: Center(
                              child: Text(
                                "Görüntüle",
                                style: TextStyle(
                                  color: recommendations[index].viewIsSelected ? Colors.white : const Color(0xffC58BF2),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                                ),
                                ),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                recommendations[index].viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent,
                                recommendations[index].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent
                                ]
                              ),
                              borderRadius: BorderRadius.circular(50)
                            ),
                          )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 25,),
                itemCount: recommendations.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20, right: 20),
              ),
            )
          ],
        );
  }

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Kategori",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 120,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 25,),
                itemBuilder: (context , index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                        ),
                        child: categories[index].icon,
                      ),
                      Text(
                        categories[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14
                        ),
                        )
                    ],
                  ),
                );
              }
            ),
            )
          ],
        );
  }

  Container _searchField() {
    return Container(
          margin: const EdgeInsets.only(top: 40,left: 20,right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0
              )
            ]
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(15),
                  hintText: "Ara",
                  hintStyle: const TextStyle(
                    color: Color(0xffDDDADA),
                    fontSize: 14,
                    ),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Container(
                    width: 100,
                    child: const IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          VerticalDivider(
                            color: Color(0xddDDDADA),
                            thickness: 0.1,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.mode_edit_rounded),
                          ),
                        ],
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                  )
                ),
              )
            ],
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "Şirket İsmi",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold
          ),
        ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: (){},
        child: Container(
          height: 20,
          width: 20,
          margin: const EdgeInsets.all(10),
          child: const Icon(Icons.arrow_back),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade200,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: (){},
          child: Container(
            height: 20,
            width: 20,
            margin: const EdgeInsets.all(10),
            child: const Icon(Icons.menu),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}