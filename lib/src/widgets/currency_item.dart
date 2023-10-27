import 'package:flutter/material.dart';

import '../models/currency.dart';
import '../screens/currency_detail_screen.dart';

class CurrencyItem extends StatelessWidget {
  const CurrencyItem({super.key, required this.currency});

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CurrencyDetailScreen(
              currency: currency,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color.fromARGB(68, 224, 224, 224),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text(
                currency.name,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        currency.charCode,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w800),
                      ),
                      if (currency.value > currency.previous)
                        const Icon(
                          Icons.arrow_drop_up,
                          size: 60,
                          color: Colors.green,
                        )
                      else
                        const Icon(
                          Icons.arrow_drop_down,
                          size: 60,
                          color: Colors.red,
                        ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${currency.value.toStringAsFixed(2)}₽",
                        style: const TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${currency.previous.toStringAsFixed(2)}₽",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
