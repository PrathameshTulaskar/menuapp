import 'package:flutter/material.dart';
import 'package:menuapp/screens/testScreen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:menuapp/data/outlets.dart';
import 'package:menuapp/screens/cart_screen.dart';
import 'package:menuapp/screens/menu_screen.dart';
import 'package:menuapp/models/app_state.dart';

import 'Provider/appstate.dart';

void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SSMenuApp());
}

class SSMenuApp extends StatefulWidget {
  @override
  _SSMenuAppState createState() => _SSMenuAppState();
}

class _SSMenuAppState extends State<SSMenuApp> {
  

  // @override
  // void initState() {
  //   super.initState();

  //   // this.appState.setOutlet(dOutlets.keys.first);
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // ignore: deprecated_member_use
     providers:[
          ChangeNotifierProvider.value(
            value: Appstate(),
          ),


     ],
      // create: (BuildContext context) {  },
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        routes: {
          MenuScreen.id: (context) => MenuScreen(),
          // CartScreen.id: (context) => CartScreen(),
        },
        // initialRoute: TestScreen(),
        home: MenuScreen(),
      ),
    );
  }
}
