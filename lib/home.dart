import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _hideButtonController;

  var _isVisible;

  get index => null;
  @override
  initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible)
          setState(() {
            _isVisible = false;
            print("**** $_isVisible up");
          });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible)
          setState(() {
            _isVisible = true;
            print("**** $_isVisible down");
          });
      }
    });
  }

  final name1 = "Home";
  final name2 = "Add";
  final icons1 = Icons.home;
  final icons2 = Icons.add;
  final colors1 = Colors.red;
  final colors2 = Colors.blue;

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    //Custom Method Call
    navpagemethod("Home", Icons.home, Colors.red),
    navpagemethod("Add", Icons.add, Colors.blue),
    navpagemethod("Person", Icons.person, Colors.green)

//Custom Widget Call
    // navpages(
    //   name: "Home",
    //   icon: Icons.home,
    //   color: Colors.red,
    // ),
    // navpages(
    //   name: "Add",
    //   icon: Icons.add,
    //   color: Colors.blue,
    // ),
    // navpages(
    //   name: name3,
    //   icon: icons3,
    //   color: colors3,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final _h = MediaQuery.of(context).size.height;
    // final _w = MediaQuery.of(context).size.width;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: SingleChildScrollView(
        controller: _hideButtonController,

        child: _widgetOptions.elementAt(_selectedIndex),
        // child: Center(
        //   child: Column(
        //     children: [
        //       for (int x = 1; x <= 50; x++) ...{
        //         Container(
        //           decoration: BoxDecoration(
        //               color: Colors.grey[200],
        //               borderRadius: BorderRadius.circular(15)),
        //           height: 50,
        //           width: 50,
        //           child: Icon(
        //             icons1,
        //             color: colors1,
        //             size: 35,
        //           ),
        //         ),
        //         Text(
        //           name1,
        //           style: TextStyle(fontSize: 10),
        //         ),
        //         SizedBox(height: 20)
        //       }
        //     ],
        //   ),
        // ),
      ),
      ////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        height: _isVisible ? 60.0 : 0.0,
        child: _isVisible
            ? new BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      title: Text('Home'),
                      backgroundColor: colors1),
                  new BottomNavigationBarItem(
                      icon: Icon(Icons.add),
                      title: Text('Add'),
                      backgroundColor: colors2),
                  new BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      title: Text('Person'),
                      backgroundColor: colors3),
                ],
                type: BottomNavigationBarType.shifting,
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.black,
                onTap: _onItemTapped,
              )
            : Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
              ),
      ),
    );
  }
}

//Custom widget

// class navpages extends StatelessWidget {
//   String name;
//   IconData icon;
//   Color color;

//   navpages({this.color, this.icon, this.name});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: navpagemethod(),
//     );
//   }

//Custom method
Widget navpagemethod(String name, IconData icon, Color color) {
  return Center(
    child: Column(
      children: [
        for (int x = 1; x <= 50; x++) ...{
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15)),
            height: 50,
            width: 50,
            child: Icon(
              icon,
              color: color,
              size: 35,
            ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 10),
          ),
          SizedBox(height: 20)
        }
      ],
    ),
  );
}

//variable assigned
const String name3 = "User";
const icons3 = Icons.person;
const colors3 = Colors.green;
