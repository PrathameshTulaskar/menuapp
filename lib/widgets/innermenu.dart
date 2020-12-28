
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:menuapp/data/ss_menu.dart';
import 'package:menuapp/models/menu_item.dart';
import 'package:menuapp/models/outlet.dart';
import 'package:provider/provider.dart';
import 'package:menuapp/data/outlets.dart';
import 'package:menuapp/models/app_state.dart';
import 'package:menuapp/widgets/menu_section.dart';class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var appState = Provider.of<Appstate>(context);
    var selectedOutlet = 0;
    // var selectedOutlet = appState.selectedOutlet;
    // var menuSections = dOutlets[selectedOutlet].menu;
   return SingleChildScrollView(

      child: Container(
        height:MediaQuery.of(context).size.height,
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
              children:<Widget>[
                    SizedBox(height: 20.0,width:20.0,),
                 ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft:Radius.circular(16.0),
                         bottomRight:Radius.circular(16.0),
                        ),
                        child:Card(
                        color: Colors.grey[200],
                   margin: EdgeInsets.all(0),

                 
                  child:Column(
                    children:<Widget>[
                      Container(
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: new AssetImage('assets/fallbackDish.png')
          )
       )),
                     
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                        Text("Burger"),
                        


                      IconButton(
                       icon:Icon(Icons.info),
                       color: Colors.blue,
                       onPressed:(){
                         showDialog(
                          context: context,
                         builder:(BuildContext context){
                              return AlertDialog(
                              title: Text("Description"),  

                                actions: [IconButton(icon: Icon(Icons.close),onPressed: ()=>Navigator.pop(context),)],
                                content:  Text("abcdef"),
                                  
                              );
                  
                         },
                         );
                       }, 
                      ),
               
                       
                      ],),
                      Text("Rs.150"),
                      
                    ],
                  ),

                  
                    
                    
                  ),
                 ),
                 
              ],),
        ),
      ),
    );
  }
}