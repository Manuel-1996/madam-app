import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/ProdottiPopolari.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'section_title.dart';
import 'package:http/http.dart' as http;

Future<List<ProdottiPopolari>> fetchAlbum() async {
  final response = await http.get('http://192.168.1.250:9000/get_articoli');

  if (response.statusCode == 200) {
    print(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return List<ProdottiPopolari>.from(
        json.decode(response.body).map((x) => ProdottiPopolari.fromJson(x)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class MyProdottiPopolari extends StatefulWidget {
  MyProdottiPopolari({Key key}) : super(key: key);

  @override
  _MyProdottiPopolari createState() => _MyProdottiPopolari();
}

class _MyProdottiPopolari extends State<MyProdottiPopolari> {
  Future<List<ProdottiPopolari>> futureProdotti;

  @override
  void initState() {
    super.initState();
    futureProdotti = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureProdotti,
        builder: (context, AsyncSnapshot<List<ProdottiPopolari>> snapshot) {
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
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ...List.generate(
                        snapshot.data.length,
                        (index) {
                          if (snapshot.data[index] != null)
                            return ProductCard(
                                product: demoProducts[index],
                                prodottiPop: snapshot.data[index]);

                          return SizedBox
                              .shrink(); // here by default width and height is 0
                        },
                      ),
                      SizedBox(width: getProportionateScreenWidth(20)),
                    ],
                  ),
                );
              }
          }
        });
  }
}
