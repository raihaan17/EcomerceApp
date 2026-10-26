import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badget;

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 14),
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: const Color(0xfff1f3f5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.storefront_outlined,
              size: 22,
              color: Color(0xff24282d),
            ),
          ),
          const SizedBox(width: 12),
          const Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'E-commerce',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.4,
                    color: Color(0xff24282d),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Belanja pilihanmu',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11, color: Color(0xff8a9098)),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Belum ada notifikasi baru.')),
              );
            },
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xfff8f9fa),
              minimumSize: const Size(40, 40),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(
              Icons.notifications_none_rounded,
              size: 21,
              color: Color(0xff42484f),
            ),
            tooltip: 'Notifikasi',
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xfff8f9fa),
              minimumSize: const Size(40, 40),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 21,
              color: Color(0xff42484f),
            ),
            tooltip: 'Keranjang',
          ),
          const SizedBox(width: 4),
          badget.Badge(
            badgeStyle: const badget.BadgeStyle(
              badgeColor: Color(0xffb42318),
              padding: EdgeInsets.all(5),
            ),
            badgeContent: const Text(
              '3',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/list_chat'),
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xfff8f9fa),
                minimumSize: const Size(40, 40),
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(
                Icons.messenger_outline_rounded,
                size: 20,
                color: Color(0xff42484f),
              ),
              tooltip: 'Pesan',
            ),
          ),
        ],
      ),
    );
  }
}
