import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String fullDescription;
  final String productUrl;

  const ProductDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.fullDescription,
    required this.productUrl,
  });

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(productUrl);
    if (!await launchUrl(url)) {
      throw 'Не работает твоя ссылка ツ $productUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 8),
            Text(fullDescription),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _launchUrl,
              child: const Text('Перейти на сайт'),
            ),
          ],
        ),
      ),
    );
  }
}
