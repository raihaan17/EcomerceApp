import 'package:flutter/material.dart';

class CategoriesWidgets extends StatelessWidget {
  const CategoriesWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Outfit',
      'Makanan',
      'Pakaian',
      'Elektronik',
      'Skincare',
      'Obat - Obatan',
    ];
    final List<IconData> icons = [
      Icons.checkroom_outlined,
      Icons.restaurant_outlined,
      Icons.shopping_bag_outlined,
      Icons.devices_outlined,
      Icons.spa_outlined,
      Icons.health_and_safety_outlined,
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          for (int i = 0; i < categories.length; i++)
            Container(
              margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffeceff1)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(icons[i], size: 18, color: const Color(0xff555c64)),
                  const SizedBox(width: 8),
                  Text(
                    categories[i],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff3f454d),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
