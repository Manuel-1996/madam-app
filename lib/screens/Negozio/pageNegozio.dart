import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/NegoziPopolari.dart';
import './constans.dart';
import './../../size_config.dart';

class NegozioInfo extends StatelessWidget {
  static String routeName = "/negozio_dettagli";
  final NegoziPopolari negoziPop;

  const NegozioInfo({Key key, @required this.negoziPop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NegozioPopolareArguments agrs =
        ModalRoute.of(context).settings.arguments;
    agrs.get_negozio();
    double defaultSize = 10;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));
    print("prima del container");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),

      height: defaultSize * 37.5, //375

      width: defaultSize *
          (SizeConfig.orientation == Orientation.landscape ? 35 : 15), //150
      // color: Colors.black45,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(agrs.negoziPop.nome_negozio, style: lightTextStyle),
            SizedBox(height: defaultSize),
            Text(
              agrs.negoziPop.nome_negozio,
              style: TextStyle(
                fontSize: defaultSize * 2.4, //24
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4,
              ),
            ),
            SizedBox(height: defaultSize * 2),
            Text("Form", style: lightTextStyle),
            Text(
              "uno",
              style: TextStyle(
                fontSize: defaultSize * 1.6, //16
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
            SizedBox(height: defaultSize * 2), //20
            Text("Available Colors", style: lightTextStyle),
            Row(
              children: <Widget>[
                buildColorBox(
                  defaultSize,
                  color: Color(0xFF7BA275),
                  isActive: true,
                ),
                buildColorBox(
                  defaultSize,
                  color: Color(0xFFD7D7D7),
                ),
                buildColorBox(
                  defaultSize,
                  color: kTextColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildColorBox(double defaultSize,
      {Color color, bool isActive = false}) {
    return Container(
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      // For  fixed value we can use cont for better performance
      padding: const EdgeInsets.all(5),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: isActive ? SvgPicture.asset("assets/icons/check.svg") : SizedBox(),
    );
  }
}

class NegozioPopolareArguments {
  final NegoziPopolari negoziPop;

  NegozioPopolareArguments({@required this.negoziPop});

  void get_negozio() {
    print(this.negoziPop.nome_negozio);
  }
}
