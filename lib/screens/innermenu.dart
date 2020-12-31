import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:menuapp/Provider/appstate.dart';
import 'package:menuapp/models/foodDishes.dart';
import 'package:provider/provider.dart';

class DishesPage extends StatefulWidget {
  @override
  _DishesPageState createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  String foodTypeSelected = "Both";
  List<FoodDishes> listFoodDishesFiltered = [];
  bool loaded = false;
  @override
  void initState() { 
    super.initState();
    Provider.of<Appstate>(context,listen: false).dishesByCategory();
  }
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<Appstate>(context);
   
    return WillPopScope(
      onWillPop: () async => true,
      child:
      //  FutureBuilder<void>(
      //     future: appState.dishesByCategory(),
      //     builder: (context, snapshot) {
      //       setState(() {
      //         if (!loaded) {
                
      //         }
      //         loaded = true;
      //       });

            // return
             SingleChildScrollView(
              child:
                  // Scaffold(
                  //   bottomNavigationBar: BottomAppBar(
                  //     child:Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children:<Widget>[
                  //         Text("Veg"),
                  //         Text("NonVeg"),
                  //         Text("Both"),
                  //       ]
                  //     ),
                  //     color:Colors.blue,
                  //   ),
                  //   body:
                  Container(
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
                      Container(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  )),
                              Text(appState.selectedCategory ?? "",
                                  style: TextStyle(
                                      fontFamily: 'Pacifico',
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400)),
                              Container()
                            ],
                          ),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black),
                      SizedBox(
                        height: 20.0,
                        width: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: DropdownButton(
                            dropdownColor: Colors.white,
                            style: TextStyle(color: Colors.black87),
                            value: foodTypeSelected,
                            items: [
                              DropdownMenuItem(
                                value: "",
                                onTap: () => print("value"),
                                child: Text(
                                  "Filter",
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Veg",
                                onTap: () => print("value"),
                                child: Text(
                                  "Veg",
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Non Veg",
                                onTap: () => print("value"),
                                child: Text("Non Veg",
                                    style: TextStyle(color: Colors.black87)),
                              ),
                              DropdownMenuItem(
                                value: "Both",
                                onTap: () => print("value"),
                                child: Text(
                                  "Both",
                                  style: TextStyle(color: Colors.black87),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              print(value + " food type selected");

                              setState(() {
                                loaded = true;
                                if (value == '' || value == 'Both') {
                                  listFoodDishesFiltered =
                                      appState.listFoodDishes;
                                  if (value == '') {
                                    foodTypeSelected = "Filter";
                                  } else {
                                    foodTypeSelected = "Both";
                                  }
                                } else {
                                  listFoodDishesFiltered =
                                      listFoodDishesFiltered
                                          .where((element) => (element.dishType
                                              .contains(foodTypeSelected)))
                                          .toList();
                                  foodTypeSelected = value;
                                }
                              });
                            }),
                      ),
                      SizedBox(
                        height: 20.0,
                        width: 20.0,
                      ),
                      Expanded(
                        child: GridView.builder(
                          // shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {                 
                            listFoodDishesFiltered = !loaded ? appState.listFoodDishes : listFoodDishesFiltered;
                            return DishWidget(
                              dishDescription:
                                  listFoodDishesFiltered[index].dishDescription,
                              dishImage: listFoodDishesFiltered[index].dishImg,
                              dishPrice:
                                  listFoodDishesFiltered[index].dishPrice,
                              dishTitle:
                                  listFoodDishesFiltered[index].dishTitle,
                            );
                          },
                          itemCount: listFoodDishesFiltered.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          // }),
    );
  }
}

class DishWidget extends StatelessWidget {
  final String dishImage;
  final String dishTitle;
  final String dishDescription;
  final String dishPrice;
  const DishWidget(
      {Key key,
      @required this.dishImage,
      @required this.dishTitle,
      @required this.dishDescription,
      @required this.dishPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0)),
        child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                // color: Colors.white, //background color of box
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 25.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    10.0, // Move to right 10  horizontally
                    10.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
              color: Colors.grey[300],
            ),
            width: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  this.dishImage ?? "",
                  fit: BoxFit.cover,
                  height: 130.0,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 4.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            this.dishTitle ?? "",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black87,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0),
                            icon: Icon(Icons.info),
                            color: Colors.blue,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(this.dishTitle ?? ""),
                                    actions: [
                                      IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () => Navigator.pop(context),
                                      )
                                    ],
                                    content: Text(this.dishDescription ?? ""),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text("Rs.${this.dishPrice ?? ""}/-",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black87,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
