import 'package:flutter/material.dart';
import 'package:state_managment/state_management_without_external_package(changenotifier,inheritedwidget,valuenotifier)/cartservice.dart';
import 'package:state_managment/state_management_without_external_package(changenotifier,inheritedwidget,valuenotifier)/services.dart';

class ProductContainer extends InheritedWidget {
  final ProductServices productServices;

  const ProductContainer({
    required this.productServices,
    required super.child,
  });

  @override
  bool updateShouldNotify(ProductContainer oldwidget) {
    return oldwidget.productServices != productServices;
  }

  static ProductServices Of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ProductContainer>()!
        .productServices;
  }
}

class CartContainer extends InheritedWidget {
  final Cartservice cartService;

  const CartContainer({
    required this.cartService,
    required super.child,
  });

  @override
  bool updateShouldNotify(CartContainer oldwidget) {
    return oldwidget.cartService != cartService;
  }

  static Cartservice Of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CartContainer>()!
        .cartService;
  }
}
