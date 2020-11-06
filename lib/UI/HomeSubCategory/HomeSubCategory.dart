import 'package:flutter/material.dart';

import '../../constants.dart' as constants;

class HomeSubCategory extends StatelessWidget {
  List<List<String>> subCategories = [
    [
      "Telfairia occidentalis (ugu)",
      "Celosia argentea (Soko)",
      "Amaranthus viridis (Green)",
      "Corchorus olitorius. (Ewedu)",
      "Gongronema latifolium (Utazi)",
      "Thaumatococcus danielli (moi moi leaf)",
      "Vernonia amygdalina (Bitterleaf)",
      "Talinum fruticosum (Water leaf)",
      "Pterocarpus mildraedii (Oha)",
      "Piper guineense (Uziza)",
      "Pyrus spp. (Pears)",
      "Abelmoschus esculentus (Okra)",
    ],
    [
      "Zingiber officinale (Ginger)",
      "Allium sativum (Garlic)",
      "Allium cepa (onion)",
      "Curcuma longa (Tumeric)",
      "Parmotrema perlatum"
    ],
    [
      "Vitamin C",
      "Malt",
      "Stout",
    ],
    ["Pawpaw leaves & roots"],
    [
      "(Beans)",
      "(Soya beans)",
      "(Wheat)",
      "Cocoa beans",
      "Sesame seeds",
    ],
    [
      "Sesame oil",
      "Palm oil",
      "Soyabean oil",
      "Shea butter",
    ],
    [
      "wheat flour",
      "Poundo yam",
    ]
  ];
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          "${arguments['title']}",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: subCategories[arguments["index"]].length,
          itemBuilder: (ctx, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(constants.kMenuDetail,
                      arguments: {
                        "title": subCategories[arguments["index"]][index]
                      });
                },
                // leading: CircleAvatar(
                //   backgroundColor: Colors.grey,
                // ),
                title: Text("${subCategories[arguments["index"]][index]}"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            );
          },
        ),
      ),
    );
  }
}
