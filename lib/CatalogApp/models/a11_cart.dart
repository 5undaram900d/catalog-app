
import 'package:catalog_app/CatalogApp/core/A13_Store.dart';
import 'package:catalog_app/CatalogApp/models/a05_item.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{

  /**********************************************
  /// for making singleton
  static final cartModel = CartModel._internal();

  CartModel._internal();        /// constructor

  factory CartModel() => cartModel;
  **********************************************/




  /// catalog fields
  A05_CatalogModel? _catalog;    /// _ makes it private
  /// collection of Ids
  final List<int> _itemIds = [];

  A05_CatalogModel? get catalog => _catalog;       /// getter method because it _catalog was private

  set catalog(A05_CatalogModel? newCatalog) {      /// set method
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  /// Get items in the cart
  List<A05_Item> get items => _itemIds.map((id) => _catalog!.getById(id)).toList();


  /// get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  /****************************
  /// add item
  void add(A05_Item item){
    _itemIds.add(item.id);
  }

  /// remove item
  void remove(A05_Item item){
    _itemIds.remove(item.id);
  }
  ****************************/

}





class AddMutation extends VxMutation <MyStore>{

  final A05_Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}





class RemoveMutation extends VxMutation <MyStore>{

  final A05_Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}






/// 6:56:00