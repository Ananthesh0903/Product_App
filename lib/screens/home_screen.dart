import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
import 'add_product_screen.dart';
import '../screens/product_details_screen.dart';
import 'service_screen.dart';
import 'product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.build),
              title: const Text('Service'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ServiceScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Product'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ProductScreen()));
              },
            ),
          ],
        ),
      ),
      body: products.isEmpty
          ? const Center(child: Text('No products added yet!'))
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(products[i].name),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              ProductDetailScreen(productId: products[i].id)));
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddProductScreen()));
        },
      ),
    );
  }
}
