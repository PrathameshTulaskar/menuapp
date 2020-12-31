import 'package:flutter/material.dart';
import 'package:menuapp/screens/testScreen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:menuapp/data/outlets.dart';
import 'package:menuapp/screens/cart_screen.dart';
import 'package:menuapp/screens/menu_screen.dart';
import 'package:menuapp/models/app_state.dart';

import 'Provider/appstate.dart';
import 'screens/innermenu.dart';

void main() async {
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
      providers: [
        ChangeNotifierProvider.value(
          value: Appstate(),
        ),
      ],
      // create: (BuildContext context) {  },
      child: MaterialApp(
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/dishesPage': (context) => DishesPage(),
          '/Menu': (context) => MenuScreen(
                id: "routing",
              ),
          // When navigating to the "/second" route, build the SecondScreen widget.
        },
        onGenerateRoute: (settings) {
          // Handle '/'
          if (settings.name == '/') {
            return MaterialPageRoute(
                builder: (context) => MenuScreen(
                      id: "Hello",
                    ));
          }

          // Handle '/details/:id'
          var uri = Uri.parse(settings.name);
          if (uri.pathSegments.length == 2 &&
              uri.pathSegments.first == 'details') {
            var id = uri.pathSegments[1];

            return MaterialPageRoute(
              builder: (context) => MenuScreen(
                id: id,
              ),
            );
          }

          return MaterialPageRoute(builder: (context) => UnknownScreen());
        },
        theme: ThemeData(fontFamily: 'Poppins'),

        // initialRoute: TestScreen(),
        home: MenuScreen(
          id: "Restaurant Name",
        ),
      ),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("hello"));
  }
}
