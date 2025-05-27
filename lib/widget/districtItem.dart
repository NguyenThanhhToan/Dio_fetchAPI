import 'package:flutter/material.dart';
import '../model/district.dart';

class DistrictItem extends StatelessWidget{

  const DistrictItem({super.key, required this.district});

  final District district;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Row(
            children: [
              const Icon(Icons.location_city, size: 32.0, color: Colors.blue),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      district.districtName,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "ID: ${district.districtId}",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
