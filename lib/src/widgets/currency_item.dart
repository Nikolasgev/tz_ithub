import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/currency.dart';
import '../screens/currency_detail_screen.dart';

class CurrencyItem extends StatefulWidget {
  const CurrencyItem({super.key, required this.currency, 
  });

  final Currency currency;

  @override
  State<CurrencyItem> createState() => _CurrencyItemState();
}

class _CurrencyItemState extends State<CurrencyItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CurrencyDetailScreen(
              currency: widget.currency,
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
                widget.currency.name,
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
                        widget.currency.charCode,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w800),
                      ),
                      if (widget.currency.value > widget.currency.previous)
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
                        "${widget.currency.value.toStringAsFixed(2)}₽",
                        style: const TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${widget.currency.previous.toStringAsFixed(2)}₽",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      bool newFavorite = !widget.currency.isFavorite;
                      prefs
                          .setBool('favorite_${widget.currency.charCode}', newFavorite)
                          .then((_) {
                        setState(() {
                          widget.currency.isFavorite = newFavorite;
                        });
                      });
                    },
                    child: Icon(
                      widget.currency.isFavorite ? Icons.star : Icons.star,
                      color: widget.currency.isFavorite
                          ? Colors.amber
                          : Colors.grey,
                      size: 50,
                    ),
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
