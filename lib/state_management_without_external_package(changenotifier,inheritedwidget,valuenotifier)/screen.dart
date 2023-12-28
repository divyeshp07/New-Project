import 'package:flutter/material.dart';
import 'package:state_managment/state_management_without_external_package(changenotifier,inheritedwidget,valuenotifier)/cartbutton.dart';
import 'package:state_managment/state_management_without_external_package(changenotifier,inheritedwidget,valuenotifier)/inheritedwidget.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductServices = ProductContainer.Of(context);
    final Cartservice = CartContainer.Of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('product list'),
          centerTitle: true,
          actions: [CartButton()],
        ),
        body: ListenableBuilder(
          listenable: Cartservice,
          builder: (context, child) => ListView.separated(
              itemBuilder: (context, index) {
                final product = ProductServices.products[index];
                final isAlreadyincart = Cartservice.products.contains(product);
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  trailing: Text(product.price.toString()),
                  leading: Icon(
                    Icons.favorite,
                    color: isAlreadyincart ? Colors.red : Colors.transparent,
                  ),
                  onTap: isAlreadyincart
                      ? null
                      : () => Cartservice.addproduct(product),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: ProductServices.products.length),
        ));
  }
}
