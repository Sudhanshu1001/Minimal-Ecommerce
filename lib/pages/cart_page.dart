import 'package:flutter/material.dart';
import 'package:minimal_ecommerce/components/my_button.dart';
import 'package:minimal_ecommerce/components/my_drawer.dart';
import 'package:minimal_ecommerce/models/product.dart';
import 'package:minimal_ecommerce/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item form cart method
  void removeItemFromCart(BuildContext context, Product product) {
    //show a dialog box to ask user to confirm to remove from cart
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text("Remove this item form your cart?"),
            actions: [
              //cancel button
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),

              //yes button
              MaterialButton(
                onPressed: () {
                  // pop dialog box
                  Navigator.pop(context);

                  // add to cart
                  context.read<Shop>().removeFromCart(product);
                },
                child: Text("Yes"),
              ),
            ],
          ),
    );
  }

  //user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: Text(
              "User wants to pay! Connect this app to your payment backend",
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(" Cart Page "),
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //cart list
          Expanded(
            child:
                cart.isEmpty
                    ? Center(child: const Text("Your cart is empty.."))
                    : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        //get individual item in cart
                        final item = cart[index];

                        //return as a cart tile UI
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            onPressed: () => removeItemFromCart(context, item),
                            icon: Icon(Icons.remove),
                          ),
                        );
                      },
                    ),
          ),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text("Pay Now"),
            ),
          ),
        ],
      ),
    );
  }
}
