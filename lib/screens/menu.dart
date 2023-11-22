import 'package:flutter/material.dart';
import 'package:shopping_catalog_mobile/widgets/left_drawer.dart';
import 'package:shopping_catalog_mobile/widgets/shop_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.amber.shade900),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.amber.shade700),
    ShopItem("Logout", Icons.logout, Colors.amber.shade500),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade200,
        title: const Text(
          'Integrated Stock Review PBP',
        ),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Integrated Stock Review PBP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}