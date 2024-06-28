
import 'package:catalog_app/CatalogApp/core/A13_Store.dart';
import 'package:catalog_app/CatalogApp/models/a11_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.size(30).bold.make(),
      ),

      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}




class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // final _cart = CartModel();
    /// fetching things by VxStore
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, _, VxState){
              return "\$${_cart.totalPrice}".text.xl4.color(context.theme.colorScheme.onSecondary).make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Product unavailability".text.make(),),);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(context.theme.floatingActionButtonTheme.backgroundColor),
            ),
            child: "Buy".text.white.make(),
          ).w24(context),
        ],
      ),
    );
  }
}







class _CartList extends StatelessWidget {

  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {

    VxState.watch(context, on: [RemoveMutation]);

    /// fetching things by VxStore
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Nothing to Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: (){
                  // _cart.remove(_cart.items[index]);
                  RemoveMutation(_cart.items[index]);
                },
              ),
              title: "${_cart.items[index].name}".text.make(),
            ),
          );
  }
}




/// 7:48:00