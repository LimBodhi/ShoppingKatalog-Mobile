import 'package:flutter/material.dart';
import 'package:shopping_catalog_mobile/screens/list_product.dart';
import 'package:shopping_catalog_mobile/screens/menu.dart';
import 'package:shopping_catalog_mobile/screens/shoppingCart_forms.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    'Integrated Stock',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Catat seluruh keperluan belanjamu di sini!",
                    // TODO: Add text style with center alignment, font size 15, white color, and normal weight
                  ),
                ),
              ],
            ),
          ), ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: const Text('Tambah Item'),
              // Bagian redirection ke ShopFormPage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShopFormPage(),
                    ));
              },
            ),
            ListTile(
                leading: const Icon(Icons.shopping_basket),
                title: const Text('Daftar Produk'),
                onTap: () {
                    // Route menu ke halaman produk
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductPage()),
                    );
                },
            ),
        ],
      ),
    );
  }
}