import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String _cacheKey = 'cachedCurrencies';

  Future<Map<String, dynamic>> fetchAllCurrencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    DateTime? lastCacheTime =
        DateTime.tryParse(prefs.getString('lastCacheTime') ?? '');
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(lastCacheTime ?? DateTime(0));

    if (lastCacheTime == null || difference.inHours >= 6) {
      try {
        final response = await http
            .get(Uri.parse('https://www.cbr-xml-daily.ru/daily_json.js'));

        if (response.statusCode == 200) {
          Map<String, dynamic> data = json.decode(response.body);
          await prefs.setString(_cacheKey, json.encode(data));
          await prefs.setString('lastCacheTime', currentTime.toIso8601String());
          return data;
        } else {
          throw Exception('Failed to load currencies');
        }
      } catch (e) {
        String? cachedData = prefs.getString(_cacheKey);

        if (cachedData != null) {
          return json.decode(cachedData);
        } else {
          throw Exception('No cached data available');
        }
      }
    } else {
      String? cachedData = prefs.getString(_cacheKey);
      if (cachedData != null) {
        return json.decode(cachedData);
      } else {
        throw Exception('No cached data available');
      }
    }
  }
}
