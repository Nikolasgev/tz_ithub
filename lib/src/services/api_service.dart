import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future<Map<String, dynamic>> fetchAllCurrencies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.get(Uri.parse('https://www.cbr-xml-daily.ru/daily_json.js'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        await prefs.setString('cachedCurrencies', json.encode(data));
        return data;
      } else {
        throw Exception('Failed to load currencies');
      }
    } catch (e) {
      String? cachedData = prefs.getString('cachedCurrencies');

      if (cachedData != null) {
        return json.decode(cachedData);
      } else {
        throw Exception('No cached data available');
      }
    }
  }
}
