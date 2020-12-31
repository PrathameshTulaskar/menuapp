import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:menuapp/models/foodCategory.dart';
import 'package:provider/provider.dart';
import 'package:menuapp/Provider/appstate.dart';
// import 'package:menuapp/data/ss_menu.dart';
// import 'package:menuapp/models/menu_item.dart';
// import 'package:menuapp/models/outlet.dart';

// import 'package:menuapp/data/outlets.dart';
// import 'package:menuapp/models/app_state.dart';
// import 'package:menuapp/widgets/menu_section.dart';

/// A container for multiple [MenuSection]s.
///
/// The parent widget to hold full menu for an outlet.
class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<Appstate>(context);
    var selectedOutlet = 0;
    // var selectedOutlet = appState.selectedOutlet;
    // var menuSections = dOutlets[selectedOutlet].menu;
    return FutureBuilder<void>(
        future: appState.getRestaurantCategory(),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          // print(appState.listFoodCategories[index].categoryTitle);
                          return CategoryWidget(
                            
                            categoryTitle: appState
                                .listFoodCategories[index].categoryTitle,
                            imageUrl:
                                appState.listFoodCategories[index].categoryImg,
                          );
                        },
                        itemCount: appState.listFoodCategories.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                      ),
                    ),
                    // Expanded(
                    //   child: GridView.count(
                    //       crossAxisCount: 2,
                    //       // mainAxisSpacing: ,
                    //       childAspectRatio: 0.99,
                    //       children: List.generate(appState.listFoodCategories.length, (index){
                    //         return
                    //       })),
                    // ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class CategoryWidget extends StatelessWidget {
  final String categoryTitle;
  final String imageUrl;
  const CategoryWidget(
      {Key key, @required this.categoryTitle, @required this.imageUrl, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<Appstate>(context);
    return InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: new BoxDecoration(
                boxShadow: [
                  // color: Colors.white, //background color of box
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 2.0, //extend the shadow
                    offset: Offset(
                      6.0, // Move to right 10  horizontally
                      6.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(this.imageUrl),
                )),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                width: 300.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(this.categoryTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ),
            ),
          ),
        ),
        onTap: () {
           appState.selectedCategorySetter = this.categoryTitle; 
          Navigator.pushNamed(context, '/dishesPage');
         
        }); 
  }
}
