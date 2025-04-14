import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = 'Update_product_page';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? title, description, image;

  num? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel myProduct =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text("Update Product"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                  onChangedFunc: (data) {
                    title = data;
                  },
                  myHintText: 'Title'),
              CustomTextField(
                onChangedFunc: (data) {
                  description = data;
                },
                myHintText: 'Description',
              ),
              CustomTextField(
                onChangedFunc: (data) {
                  price = num.parse(data);
                },
                myHintText: 'Price',
              ),
              CustomTextField(
                onChangedFunc: (data) {
                  image = data;
                },
                myHintText: 'Image',
              ),
              CustomButton(
                  onTapFunc: () async {
                    isLoading = true;
                    setState(() {});

                    try {
                      await UpdateProduct().updateProduct(
                          id: myProduct.id,
                          title: title ?? myProduct.title,
                          price: price.toString() ?? myProduct.price.toString(),
                          describtion: description ?? myProduct.description,
                          image: image ?? myProduct.imageUrl,
                          category: myProduct.category);
                    } catch (e) {
                      print(e.toString());
                      isLoading = false;
                      setState(() {});
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  buttonText: 'Update'),
            ],
          ),
        ),
      ),
    );
  }
}
