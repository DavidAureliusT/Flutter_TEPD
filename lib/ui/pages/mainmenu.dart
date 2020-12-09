part of "pages.dart";

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    AddPage(),
    DataPage(),
    AccountPage()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: "Add Data",
            //label att need upgrade
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: "List Data",
            //label att need upgrade
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: "Account",
            //label att need upgrade
          ),
        ],
      ),
    );
  }
}
