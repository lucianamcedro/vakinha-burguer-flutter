import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/helpers/loader.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/helpers/messages.dart';
import 'package:vakinha_burguer_flutter/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer_flutter/app/models/widgets/delivery_product_tile.dart';
import 'package:vakinha_burguer_flutter/app/pages/home/home_controller.dart';
import 'package:vakinha_burguer_flutter/app/pages/home/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeController>().loadProduct();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showError('Erro ao testar burro');
      }),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.stateStatus.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
          );
        },
        buildWhen: (previous, current) => current.stateStatus.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final products = state.products[index];
                    return DeliveryProductTile(
                      productModel: products,
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
