import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
import '../models/product.dart';
import 'package:uuid/uuid.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name')),
            TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final id = const Uuid().v4();
                Provider.of<ProductProvider>(context, listen: false).addProduct(
                    Product(
                        id: id,
                        name: nameController.text,
                        description: descriptionController.text));
                Navigator.pop(context);
              },
              child: const Text('Add Product'),
            )
          ],
        ),
      ),
    );
  }
}
