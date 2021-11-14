import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/main_cubit/cubit.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  keyboardType: TextInputType.text,
                  controller: searchController,
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value.toString());
                  },
                  validator: (value) {
                    if (value!.isEmpty)
                      return 'Search must not be empty';
                    else
                      return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.red)),
                  ),
                ),
              ),
              Expanded(
                child: articleListBuilder(list),
              ),
            ],
          ),
        );
      },
    );
  }
}
