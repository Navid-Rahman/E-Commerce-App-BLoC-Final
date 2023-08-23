part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  HomeLoadedSuccessState({
    required this.products,
  });

  final List<ProductDataModel> products;
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
