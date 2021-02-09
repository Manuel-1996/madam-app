import 'package:flutter/material.dart';
import 'package:shop_app/components/negozio_card.dart';
import 'package:shop_app/models/NegoziPopolari.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'section_title.dart';
import 'package:http/http.dart' as http;

Future<List<NegoziPopolari>> fetchNegozi() async {
  final response = await http.get('http://192.168.1.250:9000/get_negozi');

  if (response.statusCode == 200) {
    print(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return List<NegoziPopolari>.from(
        json.decode(response.body).map((x) => NegoziPopolari.fromJson(x)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class MyNegoziPopolari extends StatefulWidget {
  MyNegoziPopolari({Key key}) : super(key: key);

  @override
  _MyNegoziPopolari createState() => _MyNegoziPopolari();
}

class _MyNegoziPopolari extends State<MyNegoziPopolari> {
  Future<List<NegoziPopolari>> futureProdotti;

  @override
  void initState() {
    super.initState();
    futureProdotti = fetchNegozi();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureProdotti,
        builder: (context, AsyncSnapshot<List<NegoziPopolari>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return Text('');
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text(
                  '${snapshot.error}',
                  style: TextStyle(color: Colors.red),
                );
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: SectionTitle(
                        title: "I negozi più ricercati",
                        press: () {},
                      ),
                    ),
                    SizedBox(height: getProportionateScreenWidth(20)),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            2,
                            (index) {
                              if (snapshot.data[index] != null) {
                                return SpecialOfferCard(
                                  image: "assets/images/Image Banner 2.png",
                                  numOfBrands: 18,
                                  negoziPop: snapshot.data[index],
                                );
                              }
                              return SizedBox
                                  .shrink(); // here by default width and height is 0
                            },

                            /*
                            SpecialOfferCard(
                              image: "assets/images/Image Banner 2.png",
                              numOfBrands: 18,
                              negoziPop: snapshot.data[1],
                              press: () {},
                            ),
                            SpecialOfferCard(
                              image: "assets/images/Image Banner 2.png",
                              numOfBrands: 18,
                              negoziPop: snapshot.data[2],
                              press: () {},
                            ),
                            */
                          ),
                          SizedBox(width: getProportionateScreenWidth(20)),
                        ],
                      ),
                    ),
                  ],
                );
              }
          }
        });
  }
}
