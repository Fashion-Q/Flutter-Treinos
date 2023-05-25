import 'package:flutter/material.dart';

mixin LoaderStage<T extends StatefulWidget> on State<T>{
  Widget getLoaderStage({double? width, double? height}) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Stack(
            children: [
              const CircularProgressIndicator(
                color: Colors.red,
                backgroundColor: Colors.green,
              ),
              Image.asset('assets/images/maps/stage1/CastleTiles.png'),
            ],
          ),
        ),
      ),
    );
  }
}
