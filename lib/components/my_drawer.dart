import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //drawer header: logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          const SizedBox(height: 25),

          //shop tile
          MyListTile(
            text: "Shop",
            icon: Icons.home,
            onTap: () =>  Navigator.pushNamed(context, '/shop_page');,
          ),

          // cart tile
          MyListTile(
            text: "Cart",
            icon: Icons.shopping_cart_outlined,
            onTap: () {
              //pop drawer first
              Navigator.pop(context);

              // go to cart page
              Navigator.pushNamed(context, '/cart_page');
            },
          ),

          //exit shop tile
          Column(
            children: [
              MyListTile(
                text: "Exit",
                icon: Icons.logout,
                onTap:
                    () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/intro_page',
                      (route) => false,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
