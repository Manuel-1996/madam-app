import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Prodotti di tendenza", press: () {}),
        ),
        SizedBox(
            height: getProportionateScreenWidth(
                20)), //distanza tra scritta  e griglia sottostante
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                children: [
                  ...List.generate(
                    2,
                    (index) {
                      if (demoProducts[index].isPopular)
                        return ProductCard(product: demoProducts[index]);

                      return SizedBox
                          .shrink(); // here by default width and height is 0
                    },
                  ),
                ],
              ),
              Row(
                children: [],
              )
            ],
          ),
        )
      ],
    );
  }
}
