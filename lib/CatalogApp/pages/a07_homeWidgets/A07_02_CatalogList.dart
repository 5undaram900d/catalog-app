
import 'package:catalog_app/CatalogApp/models/a05_item.dart';
import 'package:catalog_app/CatalogApp/pages/a07_homeWidgets/A07_03_CatalogImage.dart';
import 'package:catalog_app/CatalogApp/pages/a07_homeWidgets/A12_AddToCart.dart';
import 'package:catalog_app/CatalogApp/pages/a09_homeDetailPage.dart';
import 'package:catalog_app/CatalogApp/utils/a08_routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: A05_CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = A05_CatalogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailPage(catalog: catalog),),),
                child: CatalogItem(catalog: catalog),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: A05_CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = A05_CatalogModel.items[index];
              return InkWell(
                // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailPage(catalog: catalog),),),
                onTap: () => context.vxNav.push(Uri(path: A08_MyRoutes.homeDetailsRoute, queryParameters: {"id": catalog.id.toString()}), params: catalog),
                child: CatalogItem(catalog: catalog),
              );
            },
          );
  }
}




class CatalogItem extends StatelessWidget {

  final A05_Item catalog;

  /// assert is basically used for the showing error at the runtime
  const CatalogItem({Key? key, required this.catalog}) : assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {

    var children2 = [
      Hero(         /// ---> Starting Animation position
        tag: Key(catalog.id.toString()),    /// this tag has same at the both start and end of the animation
        child: CatalogImage(image: catalog.imageUrl),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(context.accentColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                AddToCart(catalog: catalog,),
              ],
            ).pOnly(right: 8.0),
          ],
        ),
      ).p(context.isMobile ? 0 : 16),
    ];

    return VxBox(
      child: context.isMobile
          ? Row(
              children: children2,
            )
          : Column(
              children: children2,
            ),
    ).rounded.color(context.cardColor).square(150).make().py16();
  }
}









/// complete till 8:25:00 for url strategy