import 'dart:js';

import 'package:favourite_app_with_provider/providers/selecteditemsprovider.dart';
import 'package:favourite_app_with_provider/screens/Favourite/selectedfavouritescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Text("HSK Favourite App"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (Context) => FavouriteSelectedItemsScreen()));
            },
            child: const Icon(
              Icons.favorite_outlined,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<SelectedItemsProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        value.additeminsellist(index);
                      },
                      title: Text("item$index"),
                      trailing: Icon(value.selecteditems.contains(index)
                          ? Icons.favorite_outlined
                          : Icons.favorite_border_outlined),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
