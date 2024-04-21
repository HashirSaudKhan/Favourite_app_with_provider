import 'package:favourite_app_with_provider/providers/selecteditemsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteSelectedItemsScreen extends StatefulWidget {
  const FavouriteSelectedItemsScreen({super.key});

  @override
  State<FavouriteSelectedItemsScreen> createState() =>
      _FavouriteSelectedItemsScreenState();
}

class _FavouriteSelectedItemsScreenState
    extends State<FavouriteSelectedItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Text("HSK Favourite App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<SelectedItemsProvider>(
                builder: (context, value, child) {
              return ListView.builder(
                  itemCount: value.selecteditems.length,
                  itemBuilder: (context, index) {
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
    ;
  }
}
