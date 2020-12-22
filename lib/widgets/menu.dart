import 'package:flutter/material.dart';
import 'package:menuapp/data/ss_menu.dart';
import 'package:menuapp/models/menu_item.dart';
import 'package:menuapp/models/outlet.dart';
import 'package:provider/provider.dart';
import 'package:menuapp/data/outlets.dart';
import 'package:menuapp/models/app_state.dart';
import 'package:menuapp/widgets/menu_section.dart';

/// A container for multiple [MenuSection]s.
///
/// The parent widget to hold full menu for an outlet.
class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);
    var selectedOutlet = 0;
    // var selectedOutlet = appState.selectedOutlet;
    // var menuSections = dOutlets[selectedOutlet].menu;
    return Container(
      padding: EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        right: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child:
      //  Text("hello")
      ListView.builder(
        itemCount: 2,
        itemBuilder: (context, itemIndex) {
          return MenuSection(
            //  sectionName:  menuSections[itemIndex].name,
             sectionName:  "menuSections[itemIndex].name",
            //  sectionName: menuSections[itemIndex].(
            //     Outlet(
            //     name: 'SkewerSpot',
            //     menu: dSSMenu,
            //         )
            //  ),
    
             
            // sectionItems: menuSections[itemIndex].items,
            sectionItems: [ MenuItem(
        name: 'Nutri Kulcha',
        category: '',
        isNonVeg: false,
        price: 99,
      )],
          );
        },
      ),
    );
  }
}
