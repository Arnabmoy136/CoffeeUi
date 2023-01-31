import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:myapp/util/coffee_tile.dart';
import 'package:myapp/util/coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffee types
  final List coffeeType = [
    // [coffee type, isSelected]
    [
      'Cappucino',
      true,
    ],
    [
      'Black',
      true,
    ],
    [
      'Latte',
      true,
    ],
  ];

  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      // this loop makes every selection false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //onTap: _onItemTapped,
        elevation: 18,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color(0xFF526488),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_thumb_like_filled),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_thumb_like_filled),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                  FluentSystemIcons.ic_fluent_channel_notifications_regular),
              activeIcon: Icon(
                  FluentSystemIcons.ic_fluent_channel_notifications_regular),
              label: "person"),
        ],
      ),
      body: Column(
        children: [
          // ignore: prefer_const_constructors
          //find the best coffee you you.....
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find The best Coffee for you",
              style: TextStyle(
                fontSize: 60,
              ),
            ),
          ),

          SizedBox(height: 25),

          //Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Where Is My Cofee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: ((context, index) {
                  return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: (() {
                      coffeeTypeSelected(index);
                    }),
                  );
                })),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeImagePath: 'lib/images/latte.jpg',
                  coffeName: 'Latte',
                  coffePrice: '4.20',
                ),
                CoffeeTile(
                  coffeImagePath: 'lib/images/blackCoffee.jpg',
                  coffeName: 'Black Coffee',
                  coffePrice: '4.30',
                ),
                CoffeeTile(
                  coffeImagePath: 'lib/images/cappucino.jpg',
                  coffeName: 'Cappucino',
                  coffePrice: '4.60',
                ),
              ],
            ),
          ),

          // Horizontal Listview of coffee tiles
        ],
      ),
    );
  }
}
