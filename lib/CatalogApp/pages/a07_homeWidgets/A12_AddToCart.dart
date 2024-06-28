
import 'package:catalog_app/CatalogApp/core/A13_Store.dart';
import 'package:catalog_app/CatalogApp/models/a05_item.dart';
import 'package:catalog_app/CatalogApp/models/a11_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final A05_Item catalog;

  AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /// here give both AddMutation, RemoveMutation because on remove it is important to show reflect on main screen also
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    // fetching things by VxStore
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final A05_CatalogModel _catalog = (VxState.store as MyStore).catalog;

    bool isInCart = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
      onPressed: (){
        if(!isInCart){
          // isInCart = !isInCart;
          // isAdded = isAdded.toggle();            /// also use toggle by velocity_X
          // final _catalog = A05_CatalogModel();
          // _cart.catalog = _catalog;
          // _cart.add(catalog);
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.floatingActionButtonTheme.backgroundColor),
        shape: MaterialStateProperty.all(StadiumBorder(),),
      ),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}

