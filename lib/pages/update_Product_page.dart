import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/helper/snak_bar_message.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/update_product.dart';
import 'package:storeapp/widgets/custom_button.dart';
import 'package:storeapp/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;
  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                CustomTextField(
                  onchange: (data) {
                    productName = data;
                  },
                  labelText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onchange: (data) {
                    desc = data;
                  },
                  labelText: 'Description',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onchange: (data) {
                    price = data;
                  },
                  labelText: 'Price',
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onchange: (data) {
                    image = data;
                  },
                  labelText: 'Image',
                ),
                const SizedBox(height: 50),
                CustomButton(
                  txt: 'UpDate',
                  ontap: () {
                    isLoading = true;
                    setState(() {});
                    try {
                      upDateProduct(product);
                      showSnakBarMessage(context, 'Success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void upDateProduct(ProductModel product) {
    UpdateProductService().updateProduct(
        title: productName!,
        price: price!,
        desc: desc!,
        image: image!,
        category: product.category);
  }
}
