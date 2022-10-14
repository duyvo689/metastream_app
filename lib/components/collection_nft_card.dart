import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/values/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CollectionNftCard extends StatelessWidget {
  const CollectionNftCard(
      {Key? key, required this.collection, required this.press})
      : super(key: key);
  final Collection collection;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border.all(
                color: const Color.fromARGB(255, 51, 50, 50), width: 2),
            color: AppColors.dBlackColor.withOpacity(0.3)),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      image: DecorationImage(
                        // image: NetworkImage(collection.image.toString()),
                        // fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            collection.image.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: getProportionateScreenWidth(150),
                padding: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      collection.name.toString(),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      collection.name.toString(),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        color: AppColors.dPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
