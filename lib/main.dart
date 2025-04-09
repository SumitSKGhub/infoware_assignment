import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware/data/fetch/product_fetch.dart';
import 'package:infoware/presentation/bloc/audio_bloc.dart';
import 'package:infoware/presentation/bloc/cart_bloc.dart';
import 'package:infoware/presentation/bloc/form_bloc.dart';
import 'package:infoware/presentation/bloc/product_bloc.dart';
import 'package:infoware/presentation/bloc/product_event.dart';
import 'package:infoware/presentation/pages/products_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductBloc(productFetcher: Product_Fetcher())..add(LoadProducts())),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => FormBloc()),
        BlocProvider(create: (context) => AudioBloc())
      ],
      child: MaterialApp(home: ProductsPage(),debugShowCheckedModeBanner: false,),
    );
  }
}
