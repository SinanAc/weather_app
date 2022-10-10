import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/app/view/widgets/text_widget.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.img,
    required this.title,
    required this.data,
  }) : super(key: key);
  final String img;
  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color.fromARGB(130, 0, 16, 38),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: TextWidget(text: title, fontSize: 15)
          ),
          Image(
            height: 100.0,
            fit: BoxFit.cover,
            image: AssetImage(img),
          ),
          Center(
            child: TextWidget(text: data, fontSize: 28)
          ),
        ],
      ),
    );
  }
}
