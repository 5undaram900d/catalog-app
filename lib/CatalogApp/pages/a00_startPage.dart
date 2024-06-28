
import 'package:catalog_app/CatalogApp/core/A13_Store.dart';
import 'package:catalog_app/CatalogApp/pages/A10_CartPage.dart';
import 'package:catalog_app/CatalogApp/pages/a02_homePage.dart';
import 'package:catalog_app/CatalogApp/pages/a09_homeDetailPage.dart';
import 'package:catalog_app/CatalogApp/utils/a08_routes.dart';
import 'package:catalog_app/CatalogApp/widgets/a04_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'a01_loginPage.dart';

class A00_StartPage extends StatelessWidget {
  const A00_StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: A04_MyTheme.lightTheme(context),
      darkTheme: A04_MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      /*******************************************************
      initialRoute: A08_MyRoutes.loginRoute,
      routes: {
        "/": (context) => A01_LoginPage(),
        A08_MyRoutes.homeRoute: (context) => A02_HomePage(),
        A08_MyRoutes.loginRoute: (context) => A01_LoginPage(),
        A08_MyRoutes.cartRoute: (context) => CartPage(),
      },
      *******************************************************/
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        routes: {
          "/": (_,__) => MaterialPage(child: A01_LoginPage()),
          A08_MyRoutes.homeRoute: (_,__) => MaterialPage(child: A02_HomePage()),
          A08_MyRoutes.homeDetailsRoute: (uri,__) {
            final catalog = (VxState.store as MyStore).catalog.getById(int.parse(uri.queryParameters["id"].toString()));
            return MaterialPage(child: HomeDetailPage(catalog: catalog));
          },
          A08_MyRoutes.loginRoute: (_,__) => MaterialPage(child: A01_LoginPage()),
          A08_MyRoutes.cartRoute: (_,__) => MaterialPage(child: CartPage()),
        }
      ),
    );
  }
}




// 3:13