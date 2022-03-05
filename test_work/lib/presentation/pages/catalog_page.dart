import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('SingOut', style: TextStyle(color: Colors.black),),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.arrow_forward_sharp, color: Colors.black,),
              )
            ],
          )
        ],
        backgroundColor: Colors.white,
        title: const Text('Каталог'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(15),

          ),
        ),
      ),
    );
  }
}
