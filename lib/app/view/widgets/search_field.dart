import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:weatherapp_starter_project/app/controller/search/search_controller.dart';

class SearchField extends GetView<SearchController> {
  SearchField({
    Key? key,
  }) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  final control = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Color.fromARGB(158, 183, 194, 194),
          ),
          fillColor: Color.fromARGB(130, 0, 16, 38),
          filled: true,
          hintText: 'Search by city name',
          hintStyle: TextStyle(
            color: Color.fromARGB(158, 183, 194, 194),
          ),
          counterText: '',
        ),
        style: const TextStyle(color: Colors.white),
        onSubmitted: (_) {
          control.getData(
            searchController.text.trim(),
          );
          searchController.clear();
        },
      ),
    );
  }
}
