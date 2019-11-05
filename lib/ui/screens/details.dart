import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:placeapp/global.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: darkGrey),
        backgroundColor: grey,
        leading:
            IconButton(icon: Icon(Icons.keyboard_arrow_down), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: Icon(Icons.file_upload), onPressed: () {}),
        ],
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                itemCount: placesInfo.length,
                itemBuilder: (ctx, i) {
                  return Container(
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(.3), BlendMode.srcOver),
                        image: NetworkImage(
                          "${placesInfo[i]['img']}",
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              RatingBar(
                                initialRating: placesInfo[i]['rating'],
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemSize: 25,
                                itemCount: 5,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                              Text(
                                "${placesInfo[i]['rating']} (${placesInfo[i]['num_rating']})",
                                style:
                                    Theme.of(context).textTheme.body1.apply(
                                          color: Colors.white,
                                          fontWeightDelta: 2,
                                        ),
                              )
                            ],
                          ),
                          Text(
                            "${placesInfo[i]['name']}",
                            style: Theme.of(context).textTheme.display1.apply(
                                color: Colors.white, fontWeightDelta: 2),
                          ),
                          SizedBox(height: 7.0),
                          Row(
                            children: <Widget>[
                              Icon(Icons.lightbulb_outline,
                                  color: Colors.white),
                              Text(
                                "${placesInfo[i]['temp']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(
                                        color: Colors.white,
                                        fontWeightDelta: 2),
                              ),
                              Spacer(),
                              Text(
                                "${placesInfo[i]['wifi_signal']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .apply(
                                        color: Colors.white,
                                        fontWeightDelta: 2),
                              ),
                              Icon(Icons.wifi, color: Colors.white)
                            ],
                          ),
                          SizedBox(height: 7.0),
                          Text(
                            "${placesInfo[i]['desc']}",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            "${placesInfo[i]['rent']}",
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .apply(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
                },
                onPageChanged: (i) {
                  setState(() {
                    _active = i;
                  });
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              color: Colors.black,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: List.generate(
                  placesInfo.length,
                  (f) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      height: 5,
                      width: _active == f ? 25 : 5,
                      decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
