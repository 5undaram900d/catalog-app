

import 'dart:convert';



class A05_CatalogModel{

  /****************************************************
  /// process of doing singleton
  static final catModel = A05_CatalogModel._internal();
  A05_CatalogModel._internal();
  factory A05_CatalogModel() => catModel;
  ****************************************************/






  static List<A05_Item> items = [];

  /// get Item by id
  A05_Item getById(int id) => items.firstWhere((element) => element.id==id, orElse: null);

  /// get Item by position
  A05_Item getByPosition(int pos) => items[pos];
}

class A05_Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

  // This is the constructor
  // A05_Item(this.id, this.name, this.desc, this.price, this.color, this.imageUrl);    // simple constructor
  A05_Item (
      {
        required this.id,
        required this.name,
        required this.desc,
        required this.price,
        required this.color,
        required this.imageUrl
      }
  );    // named constructor


  A05_Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? imageUrl,
  }){
    return A05_Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'imageUrl': imageUrl,
    };
  }


  factory A05_Item.fromMap(Map <String,dynamic> map){
    return A05_Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      imageUrl: map["imageUrl"],
    );
  }

  String toJson() => json.encode(toMap());

  factory A05_Item.fromJson(String source) => A05_Item.fromMap(json.decode(source));

  @override
  bool operator == (Object o){
    if(identical(this, o)) return true;

    return o is A05_Item && o.id==id && o.name==name && o.desc==desc && o.price==price && o.color==color && o.imageUrl==imageUrl;
  }

  @override
  int get hashCode{
    return id.hashCode ^ name.hashCode ^ desc.hashCode ^ price.hashCode ^ color.hashCode ^ imageUrl.hashCode;
  }


}






// complete till 4:36:00