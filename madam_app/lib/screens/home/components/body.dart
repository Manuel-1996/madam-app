import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/home/components/ProdottiPopolari.dart';
import 'package:shop_app/screens/home/components/NegoziPopolari.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'section_title.dart';
import './home_header.dart';
import '../../cart/cart_screen.dart';
import '../../../size_config.dart';
import './categories.dart';
import 'ProdottiPopolari.dart';

import '../../Categorie/categorie.dart';
import '../../Categorie/Category.dart';

import './../../details/components/top_rounded_container.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: getProportionateScreenHeight(20)),
              /*

              HomeHeader(),


              DiscountBanner(),
            */

              Categories(),
              SizedBox(height: getProportionateScreenWidth(10)),
              MyNegoziPopolari(),
              SizedBox(height: getProportionateScreenWidth(30)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SectionTitle(
                  title: "I negozi più ricercati",
                  press: () {},
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(10)),
              buildCarouselSlider(),
              SizedBox(height: getProportionateScreenWidth(30)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SectionTitle(
                  title: "Prodotti di tendenza",
                  press: () {},
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(10)),
              MyProdottiPopolari(),
              SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),
        ),
        //CartScreen(), //ok funziona in questo modo!

        new Container(
          color: Colors.orange,
          child: Column(
            children: [
              Text(
                "Tab arancione",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.6)),
              ),
              /*

              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [],
                ),
              ),
              */
            ],
          ),
        ),

        SingleChildScrollView(
          child: Column(
            children: [
              Categorie(),
              SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),
        ),
        /*
        new Container(
          color: Colors.white,
          child: Text(
            "Mazzeo merda bianco",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.6)),
          ),
        ),
        */
        new Container(
          color: Colors.green,
          child: Text(
            "Tab verde",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.6)),
          ),
        ),
      ],
    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
      height: 150,
      viewportFraction: 0.9,
      aspectRatio: 16 / 9,
      autoPlay: true,
      enlargeCenterPage: true,
      items: imgList.map(
        (url) {
          return Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Sunny Getaways",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                            "Lorem Ipsım Dolar Lorem Ipsım Dolar Lorem Ipsım Dolar",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ).toList(),
    );
  }
}
