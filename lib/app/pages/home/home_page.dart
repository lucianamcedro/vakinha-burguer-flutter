import 'package:flutter/material.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer_flutter/app/models/product_model.dart';
import 'package:vakinha_burguer_flutter/app/models/widgets/delivery_product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return DeliveryProductTile(
                  productModel: ProductModel(
                    id: 0,
                    name: 'Lanche X',
                    description:
                        'Pão artesanal, com bife 200g, bacon, cebola caramelisada e maionese verde',
                    price: 15,
                    image:
                        'https://th.bing.com/th/id/R.1dff5bd2b2428602c8bf3b6df939d58d?rik=J7Wbhlr7n%2fbHYw&riu=http%3a%2f%2filarge.lisimg.com%2fimage%2f5996523%2f740full-hamburger.jpg&ehk=ghWzrT9k4YLS1OGYngxrRgC%2fADev8H0szYvMpzlGIJw%3d&risl=&pid=ImgRaw&r=0',
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
