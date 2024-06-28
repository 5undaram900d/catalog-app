
import 'package:catalog_app/CatalogApp/models/a05_item.dart';
import 'package:catalog_app/CatalogApp/pages/a07_homeWidgets/A12_AddToCart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {

  final A05_Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.white.bold.xl4.red500.make(),
            AddToCart(catalog: catalog).wh(110, 50),
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(       /// ---> Ending Animation position
              tag: Key(catalog.id.toString()),        /// this tag has same at the both start and end of the animation
              child: Image.network(catalog.imageUrl),
            ).h32(context).pOnly(top: 10),
            Expanded(
              child: VxArc( 
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,     // use for take full width as double.infinity
                  color: context.cardColor,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.color(context.accentColor).bold.make(),
                      catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                      10.heightBox,
                      "Only 2 devices are available in the stoke then hurry up, otherwise it will become out of sale".text.textStyle(context.captionStyle).make().p16(),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




/// completed till 5:48:00