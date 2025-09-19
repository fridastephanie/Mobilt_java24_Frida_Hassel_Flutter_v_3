import 'package:flutter/material.dart';
import '../models/travel_country.dart';
import '../services/api/country_api_service.dart';

class AddCountryViewModel extends ChangeNotifier {
  Map<String, String>? selectedCountryMap;
  DateTime? fromDate;
  DateTime? toDate;
  int rating = 3;
  bool isLoading = true;
  String? errorMessage;

  List<Map<String, String>> countries = [];

  final CountryApiService _apiService = CountryApiService();

  AddCountryViewModel() {
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    try {
      isLoading = true;
      notifyListeners();

      countries = await _apiService.fetchCountries();
      countries.sort((a, b) => a['name']!.compareTo(b['name']!));

      if (countries.isEmpty) {
        errorMessage = "No countries found from API.";
      }
    } catch (e) {
      errorMessage = "Failed to load countries: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool validateFields() => selectedCountryMap != null && fromDate != null && toDate != null;

  TravelCountry createTravel() => TravelCountry(
      country: selectedCountryMap!['name']!,
      imageUrl: selectedCountryMap!['flag']!,
      fromDate: fromDate!,
      toDate: toDate!,
      rating: rating);

  void setCountry(String? countryName) {
    if (countryName != null) {
      selectedCountryMap = countries.firstWhere((c) => c['name'] == countryName);
      notifyListeners();
    }
  }

  void setFromDate(DateTime date) {
    fromDate = date;
    notifyListeners();
  }

  void setToDate(DateTime date) {
    toDate = date;
    notifyListeners();
  }

  void setRating(int r) {
    rating = r;
    notifyListeners();
  }
}
