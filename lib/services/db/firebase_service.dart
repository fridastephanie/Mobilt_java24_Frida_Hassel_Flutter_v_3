import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/travel_country.dart';

class FirebaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addTravel(TravelCountry travel, String userId) async {
    await _db.collection('users')
        .doc(userId)
        .collection('travels')
        .add(travel.toMap());
  }

  Stream<List<TravelCountry>> getTravelsStream(String userId) {
    return _db.collection('users')
        .doc(userId)
        .collection('travels')
        .orderBy('fromDate', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => TravelCountry.fromMap(doc.data())).toList());
  }
}