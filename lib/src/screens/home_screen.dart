import 'package:flutter/material.dart';
import 'package:tz_ithub/src/screens/settings_screen.dart';

import '../models/currency.dart';
import '../services/api_service.dart';
import '../widgets/currency_item.dart';

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
      data['Valute'].forEach((key, value) {
        fetchedCurrencies.add(Currency.fromJson(value));
      });
      setState(() {
        currencies = fetchedCurrencies;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency list"),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingsScreen(
            ),
          ),
        );
          }, icon: const Icon(Icons.settings))
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
