import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tz_ithub/src/screens/settings_screen.dart';

import '../models/currency.dart';
import '../services/api_service.dart';
import '../widgets/currency_item.dart';
import 'favorite_currencies_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Currency> currencies = [];

  @override
  void initState() {
    super.initState();
    fetchCurrencies();
  }

  void fetchCurrencies() async {
    try {
      Map<String, dynamic> data = await ApiService().fetchAllCurrencies();
      List<Currency> fetchedCurrencies = [];
      SharedPreferences prefs =
          await SharedPreferences.getInstance(); // Добавлено

      data['Valute'].forEach((key, value) {
        Currency currency = Currency.fromJson(value);

        bool isFavorite =
            prefs.getBool('favorite_${currency.charCode}') ?? false;
        currency.isFavorite = isFavorite;

        fetchedCurrencies.add(currency);
      });
      setState(() {
        currencies = fetchedCurrencies;
      });
    // ignore: empty_catches
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Список валют"),
        elevation: 0,
        actions: [
          
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteCurrenciesScreen(
                    favoriteCurrencies: currencies
                        .where((currency) => currency.isFavorite)
                        .toList(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.star),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: currencies.length,
          itemBuilder: (context, index) {
            return CurrencyItem(
              currency: currencies[index],
            );
          },
        ),
      ),
    );
  }
}
