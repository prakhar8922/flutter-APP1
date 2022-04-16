import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.green700.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyTheme.darkBluishColor,
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Add to cart".text.make(),
            ).wh(120, 50)
          ],
        ).p20(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context).centered().py16(),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: Colors.white,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(MyTheme.darkBluishColor)
                              .bold
                              .make(),
                          catalog.desc.text
                              .textStyle(context.captionStyle!)
                              .xl
                              .make()
                              .py8(),
                          10.heightBox,
                          "Duo consetetur sed sed dolore ipsum takimata, labore dolores accusam et clita, justo amet no et et gubergren voluptua et,."
                              .text
                              .textStyle(context.captionStyle!)
                              .xl
                              .make()
                              .p4()
                        ],
                      ).py64(),
                    )))
          ])),
    );
  }
}
