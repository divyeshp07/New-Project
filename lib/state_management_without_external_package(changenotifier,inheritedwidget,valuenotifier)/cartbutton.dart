import 'package:flutter/material.dart';
import 'package:state_managment/state_management_without_external_package(changenotifier,inheritedwidget,valuenotifier)/cartservice.dart';
import 'package:state_managment/state_management_without_external_package(changenotifier,inheritedwidget,valuenotifier)/inheritedwidget.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cartservice = CartContainer.Of(context);
    return TextButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreenservice(),
            )),
        child: Row(
          children: [
            const Icon(Icons.shopping_cart),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: ListenableBuilder(
                listenable: Cartservice,
                builder: (context, child) =>
                    Text('cart${Cartservice.products.length}'),
              ),
            )
          ],
        ));
  }
}
