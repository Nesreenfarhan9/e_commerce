import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/custom_text_button.dart';

class ListVeiwHome extends StatefulWidget {
  const ListVeiwHome({super.key});

  @override
  State<ListVeiwHome> createState() => _ListVeiwHomeState();
}

class _ListVeiwHomeState extends State<ListVeiwHome> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List category = ["All", "Tshirts", "Jeans", "Shoes", "Hoodie"];

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CustomTextButton(
          text: category[index],
       
          isSelect: selectedIndex == index,
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
        );
      },
      separatorBuilder: (context, indext) {
        return SizedBox(width: 10);
      },
      itemCount: category.length,
    );
  }
}
