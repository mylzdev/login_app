import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:login_app/constants/colors.dart';
import 'package:login_app/features/core/controllers/opensea_controller.dart';
import 'package:login_app/features/core/models/opensea_model.dart';

import 'widget/favorite_data.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OpenseaController());

    return Scaffold(
      body: LiquidPullToRefresh(
        animSpeedFactor: 3,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: tPrimaryColor,
        onRefresh: controller.fetchOpenseaData,
        child: FutureBuilder<OpenseaModel>(
          future: controller.fetchOpenseaData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return FavoriteData(controller: controller);
              } else {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}


