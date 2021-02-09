import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';

import 'components/body.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  static String routeName = "/home";
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(context),
        key: _scaffoldKey,
        drawer: Drawer(child: leftDrawerMenu()),
        body: Body(),
        bottomNavigationBar: new TabBar(
          tabs: [
            Tab(
              icon: new Icon(Icons.home),
            ),
            Tab(
              icon: new Icon(Icons.attach_money),
            ),
            Tab(
              icon: new Icon(Icons.shopping_cart),
            ),
            Tab(
              icon: new Icon(Icons.account_circle),
            )
          ],
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.blueGrey,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(8.0),
          indicatorColor: Colors.red,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Madam",
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      leading: new IconButton(
          icon: new Icon(MaterialCommunityIcons.getIconData("menu"),
              color: Colors.black),
          onPressed: () => _scaffoldKey.currentState.openDrawer()),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            /*
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: Search(),
              ),
            );
            */
          },
          child: Icon(
            MaterialCommunityIcons.getIconData("magnify"),
            color: Colors.black,
          ),
        ),
        IconButton(
          icon: Icon(
            MaterialCommunityIcons.getIconData("cart-outline"),
          ),
          color: Colors.black,
          onPressed: () {
            /*
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: ShoppingCart(true),
              ),
            );
            */
          },
        ),
      ],
      backgroundColor: Colors.white,
    );
  }

  leftDrawerMenu() {
    Color blackColor = Colors.black.withOpacity(0.6);
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            height: 150,
            child: DrawerHeader(
              child: ListTile(
                trailing: Icon(
                  Icons.chevron_right,
                  size: 28,
                ),
                subtitle: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        //child: UserSettings(),
                      ),
                    );
                  },
                  child: Text(
                    "See Profile",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: blackColor),
                  ),
                ),
                title: Text(
                  "Manuel Perna",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: blackColor),
                ),
                leading: CircleAvatar(
                    backgroundImage: new AssetImage("assets/images/Foto.png")
                    /*
                  
                  backgroundImage: 
                  NetworkImage(
                      "https://miro.medium.com/fit/c/256/256/1*mZ3xXbns5BiBFxrdEwloKg.jpeg"),
                      */
                    ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFF8FAFB),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Feather.getIconData('home'),
              color: blackColor,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, color: blackColor),
            ),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: Home(),
                ),
              );
            },
          ),
          /*
          ListTile(
            trailing: Icon(
              Ionicons.getIconData('ios-radio-button-on'),
              color: Color(0xFFFB7C7A),
              size: 18,
            ),
            leading: Icon(Feather.getIconData('gift'), color: blackColor),
            title: Text('Wheel Spin(Free)',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  //child: WhellFortune(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Feather.getIconData('search'), color: blackColor),
            title: Text('Search',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  //child: Search(),
                ),
              );
            },
          ),
          ListTile(
            trailing: Icon(
              Ionicons.getIconData('ios-radio-button-on'),
              color: Color(0xFFFB7C7A),
              size: 18,
            ),
            leading: Icon(Feather.getIconData('bell'), color: blackColor),
            title: Text('Notifications',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              //Nav.route(context, Checkout());
            },
          ),
          ListTile(
            trailing: Icon(
              Icons.looks_two,
              color: Color(0xFFFB7C7A),
              size: 18,
            ),
            leading:
                Icon(Feather.getIconData('shopping-cart'), color: blackColor),
            title: Text('Shopping Cart',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  //child: ShoppingCart(true),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Feather.getIconData('list'), color: blackColor),
            title: Text('My Orders',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              // Nav.route(context, ProductList());
            },
          ),
          ListTile(
            leading: Icon(Feather.getIconData('award'), color: blackColor),
            title: Text('Points',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              //Nav.route(context, Checkout());
            },
          ),
          ListTile(
            leading:
                Icon(Feather.getIconData('message-circle'), color: blackColor),
            title: Text('Support',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              //  Nav.route(context, ProductList());
            },
          ),
          ListTile(
            leading:
                Icon(Feather.getIconData('help-circle'), color: blackColor),
            title: Text('Help',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              // Nav.route(context, UserSettings());
            },
          ),
          ListTile(
            leading: Icon(Feather.getIconData('settings'), color: blackColor),
            title: Text('Settings',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  //child: UserSettings(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Feather.getIconData('x-circle'), color: blackColor),
            title: Text('Quit',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackColor)),
            onTap: () {
              //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
          ),
          */
        ],
      ),
    );
  }
}
