import 'package:flutter/material.dart';
import 'package:pks3/pages/product_detail.dart';

class ItemList extends StatelessWidget {
  final String title;
  final String description;
  final String fullDescription;
  final String productUrl;

  const ItemList({
    super.key,
    required this.title,
    required this.description,
    required this.fullDescription,
    required this.productUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                title: title,
                description: description,
                fullDescription: fullDescription,
                productUrl: productUrl,
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          color: const Color.fromARGB(255, 26, 5, 52),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                color: Colors.blueAccent,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
