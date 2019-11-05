import 'package:flutter/material.dart';
import 'package:placeapp/global.dart';

class FeaturedContainer extends StatefulWidget {
  @override
  _FeaturedContainerState createState() => _FeaturedContainerState();
}

class _FeaturedContainerState extends State<FeaturedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: PageView.builder(
        itemCount: placesInfo.length,
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details'),
                      child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 7, color: Colors.grey, offset: Offset(0, 5))
              ], borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.grey.withOpacity(.3), BlendMode.srcOver),
                        image: NetworkImage("${placesInfo[i]['img']}"),
                        fit: BoxFit.cover),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "${placesInfo[i]['name']}",
                          style: Theme.of(context)
                              .textTheme
                              .headline
                              .apply(color: Colors.white),
                        ),
                        SizedBox(height: 9),
                        Text(
                          "${placesInfo[i]['rent']}",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .apply(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
