import 'dart:convert';
import 'package:http/http.dart' as http;

class CountryApiService {
  static const String apiUrl = 'https://restcountries.com/v3.1/all?fields=name,flags';

  Future<List<Map<String, String>>> fetchCountries() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map<Map<String, String>>((country) {
        return {
          'name': country['name']['common'] ?? '',
          'flag': country['flags']['png'] ?? '', 
        };
      }).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}