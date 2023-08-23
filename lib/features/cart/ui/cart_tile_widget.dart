import 'package:ecommerce_bloc_final/features/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_bloc_final/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {
  const CartTileWidget({
    Key? key,
    required this.productDataModel,
    required this.cartBloc,
  }) : super(key: key);

  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productDataModel.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            productDataModel.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '\$${productDataModel.description}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productDataModel.price.toString(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(HomeProductWishlistButtonClickedEvent(
                      //     clickedProduct: productDataModel));
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(CartRemoveFromCartEvent(
                        productDataModel: productDataModel,
                      ));
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
