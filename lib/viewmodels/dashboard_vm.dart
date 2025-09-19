import 'dart:async';
import 'package:flutter/material.dart';
import '../models/travel_country.dart';
import '../services/db/firebase_service.dart';

class DashboardViewModel extends ChangeNotifier {
  final FirebaseService _firebaseService = FirebaseService();
  List<TravelCountry> travels = [];
  StreamSubscription? _sub;
  String? _currentUserId;

  void init(String userId) {
    if (_currentUserId == userId) return;
    _currentUserId = userId;

    _sub?.cancel();

    _sub = _firebaseService.getTravelsStream(userId).listen((data) {
      travels = data;
      notifyListeners();
    });
  }

  Future<void> addTravel(TravelCountry travel, String userId) async {
    await _firebaseService.addTravel(travel, userId);
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}
