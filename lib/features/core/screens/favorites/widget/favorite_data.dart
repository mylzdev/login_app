import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:login_app/constants/colors.dart';
import 'package:login_app/features/core/controllers/profile_controller.dart';

import '../../../controllers/opensea_controller.dart';

class FavoriteData extends StatelessWidget {
  const FavoriteData({
    super.key,
    required this.controller,
  });

  final OpenseaController controller;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return MasonryGridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: controller.openseaModel?.assets?.length ?? 0,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: isDarkMode || ProfileController.instance.isDarkMode.value
                ? tCardLightColor
                : tCardDarkColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              Text(
                controller.openseaModel?.assets![index].name ?? 'no name',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  height: 100,
                  fit: BoxFit.cover,
                  controller.openseaModel!.assets?[index].imageUrl ??
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Question_mark_alternate.svg/591px-Question_mark_alternate.svg.png',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                controller.openseaModel?.assets![index].description ??
                    'no description',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
