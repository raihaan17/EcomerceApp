import 'package:flutter/material.dart';

class CartBottomnavbar extends StatelessWidget {
  const CartBottomnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 126,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6b7280),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Rp 150.000',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff17191c),
                  ),
                ),
              ],
            ),
            Material(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: Colors.white.withValues(alpha: 0.18),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Checkout belum tersedia.')),
                  );
                },
                child: const SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Check Out',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
