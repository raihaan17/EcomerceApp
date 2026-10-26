import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/account_page');
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(0xff24282d),
                  size: 22,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'My Cart',
                  style: TextStyle(
                    color: Color(0xff24282d),
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              const Icon(Icons.more_vert, color: Color(0xff6b7280)),
            ],
          ),
        ),
      ),
    );
  }
}
