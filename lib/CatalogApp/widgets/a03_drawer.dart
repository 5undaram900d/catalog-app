
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class A03_Drawer extends StatelessWidget {
  const A03_Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final imageUrl = "https://cdn.pixabay.com/photo/2018/08/28/13/29/avatar-3637561_960_720.png";
    
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              // for doing 0 padding
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                // for doing 0 margin
                margin: EdgeInsets.zero,
                accountName: Text('Danger Era'),
                accountEmail: Text('danger@gmail.com'),
                // currentAccountPicture: Image.network(imageUrl),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              )
            ),
            ListTile(
              leading: Icon(CupertinoIcons.house, color: Colors.white,),
              title: Text('Home', textScaleFactor: 1.2, style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
              title: Text('Profile', textScaleFactor: 1.2, style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white,),
              title: Text('Email me', textScaleFactor: 1.2, style: TextStyle(color: Colors.white,fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}




// 3:06