import 'package:flutter/material.dart';

import '../models/modelo.dart';

class Componentes {
  Widget getContainer(double width, double height, int index, Modelo model) {
    return Padding(
      padding: const EdgeInsets.only(top: 5,bottom: 5),
      child: Container(
        width: width,
        height: height,
        color: index % 2 == 0 ? Colors.red : Colors.green,
        child: ListView(
          children: [
            getRow("id: ", model.id.toString()),
            getRow("title: ", model.title),
            getRow("description: ", model.description),
            getRow("price: ", "${model.price.toString()} \$"),
            getRow("discountPercent: ", "${model.discountPercent.toString()} %"),
            getRow("rating: ", model.rating.toString()),
            getRow("stock: ", model.stock.toString()),
            getRow("brand: ", model.brand),
            getRow("category: ", model.category),
            getRow("smartphones: ", model.smartphones),
            getRow("thumbnail: ", model.thumbnail),
            model.images.isEmpty
                ? getRow("images: ", "No info")
                : Padding(
                  padding: const EdgeInsets.only(left: 10,top: 3,bottom: 3),
                  child: SizedBox(
                      height: 80,
                      width: width,
                      child: getImages(model),
                    ),
                )
          ],
        ),
      ),
    );
  }

  Widget getImages(Modelo model) {
    return ListView.builder(
      itemCount: model.images.length,
      itemBuilder: (BuildContext context, int index) {
        return Text("Image$index: ${model.images[index]}");
      },
    );
  }
  // child: ListView.builder(
  //         itemCount: 1,
  //         itemBuilder: (BuildContext context, int index) {
  //           return comp.getContainer(size.width,300,index,modelo[index]);
  //         },
  //       ),

  Widget getRow(String s1, String s2) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 3,bottom: 3),
      child: Row(
        children: [
          Text(s1),
          Flexible(child: Text(s2)),
        ],
      ),
    );
  }
}
