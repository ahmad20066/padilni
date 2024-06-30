import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/presentation/home/widgets/list/list_item.dart';

class ListGrid extends StatelessWidget {
  final List<ItemModel> items;
  const ListGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisSpacing: 20.h,
                childAspectRatio: 1.2,
                crossAxisSpacing: 5.w),
            itemBuilder: (context, index) => ListItem(
              item: items[index],
            ),
          ),
        ),
        SizedBox(
          height: 50.h,
        )
      ],
    );
  }
}
