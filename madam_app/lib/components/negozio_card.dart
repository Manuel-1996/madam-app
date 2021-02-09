import 'package:flutter/material.dart';
import '../size_config.dart';
import '../screens/Negozio/pageNegozio.dart';
import 'package:shop_app/models/NegoziPopolari.dart';
import '../screens/Negozio/details/details_screen.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard(
      {Key key,
      @required this.nome_negozio,
      @required this.image,
      @required this.numOfBrands,
      @required this.press,
      @required this.negoziPop})
      : super(key: key);

  final String nome_negozio, image;
  final int numOfBrands;
  final GestureTapCallback press;
  final NegoziPopolari negoziPop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                negoziPop: negoziPop,
              ),
            ),
          ), //rendeirizzo qui pageNegozio
          child: SizedBox(
            width: getProportionateScreenWidth(242),
            height: getProportionateScreenWidth(100),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF343434).withOpacity(0.4),
                          Color(0xFF343434).withOpacity(0.15),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15.0),
                      vertical: getProportionateScreenWidth(10),
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "${negoziPop.nome_negozio}\n",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: "$numOfBrands Brands")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
