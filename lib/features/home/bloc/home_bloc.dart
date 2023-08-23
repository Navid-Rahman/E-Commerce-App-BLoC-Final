import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_bloc_final/data/cart_items.dart';
import 'package:ecommerce_bloc_final/data/grocery_data.dart';
import 'package:ecommerce_bloc_final/data/wishlist_items.dart';
import 'package:ecommerce_bloc_final/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClicketEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeWishlistButtonNavigateClickedEvent>(
        homeWishlistButtonNavigateClickedEvent);

    on<HomeCartButtonNavigateClickedEvent>(homeCartButtonNavigateClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));

    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  description: e['description'],
                  price: e['price'],
                  imageUrl: e['imageUrl'],
                ))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClicketEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist product clicked');
    wishlistItems.add(event.clickedProduct);
    emit(
      HomeProductItemWishlistedActionState(),
    );
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart product clicked');
    cartItems.add(event.clickedProduct);
    emit(
      HomeProductItemCartedActionState(),
    );
  }

  FutureOr<void> homeWishlistButtonNavigateClickedEvent(
      HomeWishlistButtonNavigateClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist navigate clicked');
    emit(
      HomeNavigateToWishlistPageActionState(),
    );
  }

  FutureOr<void> homeCartButtonNavigateClickedEvent(
      HomeCartButtonNavigateClickedEvent event, Emitter<HomeState> emit) {
    print('Cart navigate clicked');
    emit(
      HomeNavigateToCartPageActionState(),
    );
  }
}
