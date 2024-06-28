
import 'package:catalog_app/CatalogApp/core/A13_Store.dart';
import 'package:catalog_app/CatalogApp/models/a05_item.dart';
import 'package:catalog_app/CatalogApp/models/a11_cart.dart';
import 'package:catalog_app/CatalogApp/utils/a08_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';

import 'a07_homeWidgets/A07_01_CatalogHeader.dart';
import 'a07_homeWidgets/A07_02_CatalogList.dart';

class A02_HomePage extends StatefulWidget {
  const A02_HomePage({Key? key}) : super(key: key);

  @override
  State<A02_HomePage> createState() => _A02_HomePageState();
}

class _A02_HomePageState extends State<A02_HomePage> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson.toString());
    var productData = decodedData['product'];
    A05_CatalogModel.items = List.from(productData).map<A05_Item>((item) => A05_Item.fromMap(item)).toList();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      /*
      appBar: AppBar(
        title: Text('Catalog App',),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (A05_CatalogModel.items!=null && A05_CatalogModel.items.isNotEmpty)
          // ? ListView.builder(
          //     itemCount: A05_CatalogModel.items.length,
          //     itemBuilder: (context, index) {
          //       return A06_ItemWidget(item: A05_CatalogModel.items[index],);
          //     }
          //   )
          ? GridView.builder(
              itemCount: A05_CatalogModel.items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index){
                final item = A05_CatalogModel.items[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: GridTile(
                    header: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                      ),
                      child: Text(item.name, style: TextStyle(color: Colors.white),),
                    ),
                    child: Image.network(item.imageUrl),
                    footer: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Text(item.price.toString(), style: TextStyle(color: Colors.white),),
                    ),
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator(),),
      ),
      drawer: A03_Drawer(),
      */



      backgroundColor: context.canvasColor,                 // by velocity_x
      // backgroundColor: Theme.of(context).canvasColor,          // without velocity_x
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, VxState) =>  FloatingActionButton(
          backgroundColor: context.theme.floatingActionButtonTheme.backgroundColor,
          // onPressed: () => Navigator.pushNamed(context, A08_MyRoutes.cartRoute),
          onPressed: () => context.vxNav.push(Uri.parse(A08_MyRoutes.cartRoute)),
          child: Icon(CupertinoIcons.cart, color: Colors.white,),
        ).badge(color: Vx.white, size: 22, count: _cart.items.length, textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        /// just above badge is used for showing a badge above to icon by Velocity_x
      ),

      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(A05_CatalogModel.items!=null && A05_CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),



    );
  }
}






// 5:07:00