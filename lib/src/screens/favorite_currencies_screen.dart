import 'package:flutter/material.dart';
import '../models/currency.dart';
import '../widgets/currency_item.dart';

class FavoriteCurrenciesScreen extends StatelessWidget {
  final List<Currency> favoriteCurrencies;

  const FavoriteCurrenciesScreen({super.key, required this.favoriteCurrencies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Избранные валюты"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: favoriteCurrencies.length,
          itemBuilder: (context, index) {
            return CurrencyItem(
              currency: favoriteCurrencies[index],
            );
          },
        ),
      ),
    );
  }
}
