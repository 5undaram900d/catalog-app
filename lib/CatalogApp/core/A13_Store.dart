
import 'package:catalog_app/CatalogApp/models/a05_item.dart';
import 'package:catalog_app/CatalogApp/models/a11_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  late A05_CatalogModel catalog;
  late CartModel cart;

  MyStore(){
    catalog = A05_CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}