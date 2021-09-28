import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rss_lecture/src/utils/utils.dart';

import 'image_news_widget.dart';

class ListItemWidget extends StatelessWidget {
  final RssItem item;

  const ListItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.green, spreadRadius: 3)]),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: IntrinsicHeight(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                  child: Text(
                    item.author ?? 'Автор неизвестен',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ImageNewsWidget(
                        urlImage: item.enclosure!.url!,
                        width: 120,
                        height: 90,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      item.title!,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 5,
                    )),
                  ],
                ),
                Expanded(
                    child: Text(
                  item.description!,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  maxLines: 10,
                )),
                InkWell(
                  child: const Text('Читать на сайте',
                      style: TextStyle(decoration: TextDecoration.underline)),
                  onTap: () => launchUniversalLink(item.link!),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
