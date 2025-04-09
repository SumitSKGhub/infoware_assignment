

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware/data/models/product_model.dart';
import 'package:infoware/presentation/bloc/cart_event.dart';
import 'package:infoware/presentation/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState>{
  CartBloc(): super(CartState(cartItems: {})){
    on<AddToCart>((event, emit) {
      final updatedCart = Map<ProductModel, int>.from(state.cartItems);
      updatedCart[event.product] = (updatedCart[event.product] ?? 0) + 1;
      emit(CartState(cartItems: updatedCart));
    });

    on<RemoveFromCart>((event, emit) {
      final updatedCart = Map<ProductModel, int>.from(state.cartItems);
      updatedCart.remove(event.product);
      emit(CartState(cartItems: updatedCart));
    });

    on<UpdateQuantity>((event, emit) {
      final updatedCart = Map<ProductModel, int>.from(state.cartItems);
      if (event.quantity > 0) {
        updatedCart[event.product] = event.quantity;
      } else {
        updatedCart.remove(event.product);
      }
      emit(CartState(cartItems: updatedCart));
    });
  }
}