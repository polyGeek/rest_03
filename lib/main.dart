import 'package:flutter/material.dart';
import 'package:rest_03/model/menu/menu_controller.dart';
import 'package:rest_03/widgets/loading.dart';


void main() {
  runApp( MyApp() );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  /// The "body" is initialized to the Loading/CircularProgress
  Widget body = const Loading(msg: 'Loading Menu Items' );

  @override
  void initState() {
    super.initState();

    /// Call the loadMenu method. The code in that method can't be added directly here
    /// because it's async and the initState() can't be an async method.
    loadMenu();
  }

  void loadMenu() async {

    /// The MenuController().getMenuItems() triggers a cascade of actions that
    /// ultimately either succeed or they don't.
    bool success = await MenuController().getMenuItems();

    /// It would be more concise to remove the "success" boolean completely and
    /// place the MenuController().getMenuItems() directly in the if() condition.
    /// However, I find that to be less readable.
    if( success == true ) {
      body = _MenuList();
    } else {
      body = LoadingError();
    }

    /// Shortcut to setState().
    _update();
  }

  /// Instead of calling setState in each instance it's needed this method provides
  /// a shortcut and adds if( mounted ) protection. This is in case _update() is called
  /// from some point when this view isn't rendered. Which would produce an error.
  void _update() {
    if( mounted ) {
      setState(() {});
    }
  }


  @override
  Widget build( BuildContext context ) {
    return Scaffold(

      appBar: AppBar(
        title: const Align(alignment: Alignment.bottomCenter,
          child: Text(
              'Dinner Menu',
              textAlign: TextAlign.center
          ),
        ),
      ),

      body: body,
    );
  }
}

class _MenuList extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return ListView.builder(
      itemCount: MenuController().menuList.length,
      itemBuilder: ( _, index ) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [
              Row(
                children: [

                  Text(
                      MenuController().menuList[ index ].name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      )
                  ),

                  const SizedBox( width: 10,),

                  Text(
                    '[' + MenuController().menuList[ index ].calories.toString() + 'cal]',
                    style: const TextStyle( fontStyle: FontStyle.italic, fontSize: 12 ),
                  ),
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  const Flexible(
                    child: Text(
                      'Description goes here and this text should wrap if it is too long. '
                          'Description goes here and this text should wrap if it is too long.'
                          'Description goes here and this text should wrap if it is too long. ',
                      style: TextStyle( fontSize: 14 ),
                    ),
                  ),

                  Text(
                      '\$' + MenuController().menuList[ index ].price.toString()
                  ),
                ],
              ),

            ],
          ),
        );
      },
    );
  }
}




