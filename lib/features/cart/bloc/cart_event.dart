part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  CartRemoveFromCartEvent({
    required this.productDataModel,
  });

  final ProductDataModel productDataModel;
}
