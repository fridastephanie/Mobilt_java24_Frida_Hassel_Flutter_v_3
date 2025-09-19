import 'package:flutter/material.dart';
import '../models/travel_country.dart';

class TravelCard extends StatelessWidget {
  final TravelCountry travel;
  const TravelCard({super.key, required this.travel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                travel.country,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                ),
                child: Image.network(
                  travel.imageUrl,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const SizedBox(height: 120, child: Center(child: Text('No image'))),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Visited: ${travel.fromDate.toLocal().toString().split(' ')[0]} – ${travel.toDate.toLocal().toString().split(' ')[0]}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Trip rating: ${travel.rating}/5',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}