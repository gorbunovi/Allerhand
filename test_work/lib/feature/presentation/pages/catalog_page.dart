import 'package:flutter/material.dart';
import 'package:test_work/feature/presentation/widgets/catalog_widgets/person_list_widget.dart';

import '../widgets/catalog_widgets/sing_out_widget.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          SingOut(context),
        ],
      ),
      body: PersonsList(),
    );
  }
}
