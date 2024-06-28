
import 'package:catalog_app/CatalogApp/models/a05_item.dart';
import 'package:flutter/material.dart';

class A06_ItemWidget extends StatelessWidget {

  final A05_Item item;

  const A06_ItemWidget({Key? key, required this.item}) : assert(key == null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          debugPrint("${item.name} pressed");
        },
        leading: Image.network(item.imageUrl.toString()),
        title: Text(item.name.toString()),
        subtitle: Text(item.desc.toString()),
        trailing: Text("\$${item.price.toString()}",textScaleFactor: 1.5, style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),),
      ),
    );
  }
}


// 4:05