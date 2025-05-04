import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
import '../models/product.dart';

class EditProductScreen extends StatelessWidget {
  final Product product;

  const EditProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController(text: product.name);
    final _descriptionController =
        TextEditingController(text: product.description);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name')),
            TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false)
                    .updateProduct(Product(
                        id: product.id,
                        name: _nameController.text,
                        description: _descriptionController.text));
                Navigator.pop(context);
              },
              child: const Text('Save Changes'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false)
                    .deleteProduct(product.id);
                Navigator.pop(context);
              },
              child: const Text('Delete Product'),
            )
          ],
        ),
      ),
    );
  }
}
