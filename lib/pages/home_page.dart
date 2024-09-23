import 'package:flutter/material.dart';
import 'package:pks3/components/item_list.dart';
import 'package:pks3/components/products.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

Future<List<Product>> loadProducts() async {
  try {
    final String response = await rootBundle.loadString('assets/products.json');
    final List<dynamic> data = json.decode(response);
    return data.map((item) => Product.fromJson(item)).toList();
  } catch (e) {
    print('Ошибка при загрузке продуктов: $e');
    throw Exception('Ошибка загрузки данных');
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: loadProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Ошибка: ${snapshot.error}'));
        } else {
          final products = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Аптечка'),
            ),
            body: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return ItemList(
                  title: product.title,
                  description: product.description,
                  productUrl: product.url,
                  fullDescription: product.fullDescription,
                );
              },
            ),
          );
        }
      },
    );
  }
}
