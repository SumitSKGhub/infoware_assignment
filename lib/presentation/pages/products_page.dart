import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware/data/models/product_model.dart';
import 'package:infoware/presentation/bloc/cart_bloc.dart';
import 'package:infoware/presentation/bloc/cart_event.dart';
import 'package:infoware/presentation/bloc/cart_state.dart';
import 'package:infoware/presentation/bloc/product_bloc.dart';
import 'package:infoware/presentation/bloc/product_event.dart';
import 'package:infoware/presentation/bloc/product_state.dart';
import 'package:infoware/presentation/pages/audio_page.dart';
import 'package:infoware/presentation/pages/cart_page.dart';
import 'package:infoware/presentation/pages/form_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(LoadProducts(page: 0));

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        final productBloc = BlocProvider.of<ProductBloc>(context);
        BlocProvider.of<ProductBloc>(context).add(LoadProducts(page: productBloc.currentPage));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xFFFAE1EB),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              height: 200,
              color: Colors.pinkAccent,
              child: Center(
                child: Text("Other links🔗",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            ),
            ListTile(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => FormPage())
              ),
              title: Text("Form📄",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
            ),
            Divider(color: Colors.pink,),
            ListTile(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => AudioPage())
              ),
              title: Text("Audio Player🎵",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
            ),
          ],
        ),

      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAE1EB),
        title: Text("Products"),
        centerTitle: true,
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.shopping_cart, color: Colors.black, size: 28),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartPage()),
                        );
                      },
                    ),
                    if (state.cartItems.isNotEmpty)
                      Positioned(
                        right: 6,
                        top: 6,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.pink[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          child: Text(
                            state.noofItems.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFFFEBEB),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          final productBloc = BlocProvider.of<ProductBloc>(context);
          if (state is ProductLoading && productBloc.currentPage == 0) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return GridView.builder(
              controller: _scrollController,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300,
              ),
              itemCount: state.products.length + (state.hasMore ? 2 : 0),
              itemBuilder: (context, index) {
                if (index >= state.products.length) {
                  return Center(child: CircularProgressIndicator());
                }
                final product = state.products[index];
                return _buildProductTile(context, product);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

Widget _buildProductTile(BuildContext context, ProductModel product) {
  return Card(
    child: GridTile(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 180,
                  width: 200,
                  child: Center(),
                ),
                Image.network(
                  product.thumbnail,
                  alignment: Alignment.center,
                ),
                Positioned(
                  left: 80,
                  right: 10,
                  bottom: 5,
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context).add(AddToCart(product));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100,40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Add",style: TextStyle(color: Colors.pink[400]),)),
                ),
              ],
            ),
            Text(product.title, style: TextStyle(fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis)),
            Text(product.brand, style: TextStyle(fontWeight: FontWeight.w400)),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  "₹${product.price}  ",
                  style: TextStyle(fontWeight: FontWeight.w300,decoration: TextDecoration.lineThrough),
                ),
                Text(
                  "₹${product.discountedPrice.toStringAsFixed(2)}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ],
            ),
            Text(
              "${product.discountPercentage}% OFF",
              style: TextStyle(color: Colors.pink[200],fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
