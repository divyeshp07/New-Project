import 'package:flutter/material.dart';
import 'package:state_managment/state_management_without_external_package(changenotifier,inheritedwidget,valuenotifier)/inheritedwidget.dart';
import 'package:state_managment/state_management_without_external_package(changenotifier,inheritedwidget,valuenotifier)/model.dart';

class Cartservice extends ChangeNotifier {
  final List<Productmdl> products = [];

  void addproduct(Productmdl product) {
    if (!products.contains(product)) {
      products.add(product);
      notifyListeners();
    }
  }

  void removeproduct(Productmdl product) {
    if (products.contains(product)) {
      products.remove(product);
      notifyListeners();
    }
  }
}

class CartScreenservice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cartservice = CartContainer.Of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('cart'),
      ),
      body: ListenableBuilder(
        listenable: Cartservice,
        builder: (context, child) {
          if (Cartservice.products.isEmpty) {
            return const Center(
              child: Text('cart is empty'),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final product = Cartservice.products[index];
                  return ListTile(
                    title: Text(product.name),
                    trailing: IconButton(
                        onPressed: () => Cartservice.removeproduct(product),
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        )),
                    // trailing: Icon(

                    //   Icons.remove_circle,
                    //   color: Colors.red,

                    // ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: Cartservice.products.length);
          }
        },
      ),
    );
  }
}
