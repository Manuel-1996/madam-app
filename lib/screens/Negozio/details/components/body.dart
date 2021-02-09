import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';
import '../../../../models/NegoziPopolari.dart';
import '../size_config.dart';

import 'product_description.dart';
import 'product_info.dart';

class Body extends StatelessWidget {
  final NegoziPopolari negoziPop;

  const Body({Key key, this.negoziPop}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight - AppBar().preferredSize.height,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductInfo(negoziPop: negoziPop),
            Positioned(
              top: defaultSize * 37.5,
              left: 0,
              right: 0,
              child: ProductDescription(
                negoziPop: negoziPop,
                press: () {},
              ),
            ),
            Positioned(
              top: defaultSize * 9.5,
              right: -defaultSize * 7.5,
              child: Hero(
                tag: negoziPop.id_negozio,
                child: Image.network(
                  "assets/images/Foto.png",
                  fit: BoxFit.cover,
                  height: defaultSize * 37.8, //378
                  width: defaultSize * 36.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
