import 'package:flutter/material.dart';
import 'package:graduation/components/appBar/reusableAppBar.dart';
import 'package:graduation/constants/colors.dart';
import 'package:provider/provider.dart';
import '../../components/text/text_button.dart';
import '../../models/data_product_model.dart';
import '../../models/model_provider.dart';
import '../main_screen.dart';
import '../navbar_screens/shopping_cart_screen.dart';

class ProductsScreenDetails extends StatefulWidget {
  static const String productsDetailsScreenRoute = 'products details screen';
  final DataProductModel detailsProduct;
  final int productState;

  const ProductsScreenDetails({
    Key? key,
    required this.detailsProduct,
    required this.productState,
  }) : super(key: key);

  @override
  State<ProductsScreenDetails> createState() => _ProductsScreenDetailsState();
}

class _ProductsScreenDetailsState extends State<ProductsScreenDetails> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProvider>(builder: ((context, classInstance, child) {
      return Scaffold(
        appBar: ReusableAppBar(
          leadingFunction: () {
            Navigator.pushNamedAndRemoveUntil(
                context, MainScreen.homeScreenRoute, (route) => false);
          },
          title: 'Details Product',
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: Image.network(
                    widget.detailsProduct.productImage,
                    height: 300, // change
                  )),
                  Row(
                    children: [
                      Text(
                        widget.detailsProduct.productName,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Row(
                    children: [
                      Text(
                        'Price: ',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 20,
                          fontWeight: FontWeight.w600,
                          color: defBlue,
                        ),
                      ),
                      Text(
                        //'35.00',
                        '\$ ${widget.detailsProduct.productPrice.toString()}',
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          widget.detailsProduct.productDescription,
                          maxLines: isShowMore ? 2 : null,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isShowMore = !isShowMore;
                          });
                        },
                        child: Text(
                          isShowMore ? 'show more' : 'show less',
                          style: const TextStyle(
                              fontSize: 17.5, color: Colors.lightBlue),
                        ),
                      ),
                    ],
                  ),

                ],
              );
            },
          ),
        ),
      );
    }));
  }
}
