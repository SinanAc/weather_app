import 'dart:developer';

import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.searchController,
  }) : super(key: key);
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          enabledBorder: OutlineInputBorder(
             borderSide:  BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: OutlineInputBorder(
             borderSide:  BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          prefixIcon: Icon(Icons.search,color: Color.fromARGB(158, 183, 194, 194)),
          fillColor: Color.fromARGB(130, 0, 16, 38),
          filled: true,
          hintText: 'Search by city name',
          hintStyle:TextStyle(
            color:  Color.fromARGB(158, 183, 194, 194)
          ),
          counterText: '',
      ),
      style: const TextStyle(color: Colors.white),
      onSubmitted: (_){
        log(searchController.text);
      },
                ),
    );
  }
}