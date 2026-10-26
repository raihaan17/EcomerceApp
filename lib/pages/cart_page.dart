import 'package:flutter/material.dart';
import 'package:ecomerceapp/widgets/cart_appbar.dart';
import 'package:ecomerceapp/widgets/cart_itemsamples.dart';
import 'package:ecomerceapp/widgets/cart_bottomnavbar..dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Efek shadow pada CartAppBar dapat ditambahkan melalui PreferredSize/Container
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: const Border(
              bottom: BorderSide(color: Color(0xffeceff1)),
            ),
          ),
          child: const CartAppBar(),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: const BoxDecoration(
              color: Color(0xfff8f9fa),
            ),
            child: Column(
              children: [
                // 3. Area Input Kode Kupon (Lengkap dengan Shadow)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xffe5e7eb)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Masukkan kode kupon',
                              prefixIcon: const Icon(Icons.local_offer_outlined),
                              isDense: true,
                              border: InputBorder.none, // Tampilan lebih bersih di dalam box
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // 2. Tombol Apply dengan Efek Klik Built-in
                        FilledButton(
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Fitur kupon belum terhubung ke backend.',
                                ),
                              ),
                            );
                          },
                          child: const Text('Apply'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                
                // 1. Box Item Cart dengan Wrapping Shadow
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xffeceff1)),
                    ),
                    child: const CartItemSamples(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CartBottomnavbar(),
    );
  }
}