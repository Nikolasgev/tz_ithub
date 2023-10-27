import 'package:flutter/material.dart';
import 'package:tz_ithub/src/models/currency.dart';

class CurrencyDetailScreen extends StatelessWidget {
  const CurrencyDetailScreen({super.key, required this.currency});

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    double changes = currency.value - currency.previous;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currency.name,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              currency.charCode,
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            const Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "ID: ${currency.id}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "NumCode: ${currency.numCode}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${changes.toStringAsFixed(4)}₽",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                if (currency.value < currency.previous)
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.red,
                    size: 80,
                  )
                else
                  const Icon(
                    Icons.arrow_drop_up,
                    color: Colors.green,
                    size: 80,
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "New: ",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${currency.value}₽",
                  style: const TextStyle(
                      fontSize: 38, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Old: ",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${currency.previous}₽",
                  style: const TextStyle(
                      fontSize: 38, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
