part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  HomeProductWishlistButtonClickedEvent({
    required this.clickedProduct,
  });

  final ProductDataModel clickedProduct;
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  HomeProductCartButtonClickedEvent({
    required this.clickedProduct,
  });

  final ProductDataModel clickedProduct;
}

class HomeWishlistButtonNavigateClickedEvent extends HomeEvent {}

class HomeCartButtonNavigateClickedEvent extends HomeEvent {}
