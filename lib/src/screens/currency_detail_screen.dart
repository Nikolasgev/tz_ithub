import 'package:flutter/material.dart';
import 'package:tz_ithub/src/models/currency.dart';

class CurrencyDetailScreen extends StatefulWidget {
  const CurrencyDetailScreen({super.key, required this.currency});

  final Currency currency;

  @override
  State<CurrencyDetailScreen> createState() => _CurrencyDetailScreenState();
}

class _CurrencyDetailScreenState extends State<CurrencyDetailScreen> {
  double convertedValue = 0.0;
  @override
  Widget build(BuildContext context) {

    double convertCurrency(double rubAmount, double exchangeRate) {
      return rubAmount / exchangeRate;
    }


    double changes = widget.currency.value - widget.currency.previous;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.currency.name,
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
              widget.currency.charCode,
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
                  "ID: ${widget.currency.id}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "NumCode: ${widget.currency.numCode}",
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
                if (widget.currency.value < widget.currency.previous)
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
                  "${widget.currency.value}₽",
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
                  "${widget.currency.previous}₽",
                  style: const TextStyle(
                      fontSize: 38, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  double rubAmount = double.tryParse(value) ?? 0;
                  double convertedAmount =
                      convertCurrency(rubAmount, widget.currency.value);

                  setState(() {
                    convertedValue = convertedAmount;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Введите сумму в рублях',
                  suffixIcon: Icon(Icons.currency_ruble), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Можно купить: ${convertedValue.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.currency.name,
              style: const TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
