import 'package:flutter/material.dart';
import 'package:placeapp/global.dart';
import 'package:placeapp/ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyDropDownButton(),
                    IconButton(
                      icon: CircleAvatar(
                        backgroundImage: NetworkImage(profilePicture),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(
                      Icons.search,
                      color: darkGrey,
                    ),
                    fillColor: Color(0xffe6e7eb),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              MyMenu(),
              FeaturedContainer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Your Current Location",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              IgnorePointer(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    shrinkWrap: true,
                    children: <Widget>[
                      MyMap(),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.blue..withOpacity(.4)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: RadialGradient(
                                    colors: [
                                      Colors.white60,
                                      Colors.white30,
                                      Colors.blueAccent,
                                    ],
                                  ),
                                ),
                                child: Icon(
                                  Icons.brightness_5,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              "31 °",
                              style: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .apply(color: Colors.white, fontWeightDelta: 2),
                            ),
                            Text(
                              "Sydney",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .apply(color: Colors.white, fontWeightDelta: 2),
                            )
                          ],
                        ),
                      ),
                      PlaceContainer(img:  "https://cdn.pixabay.com/photo/2015/03/26/09/48/chicago-690364_960_720.jpg"),
                      PlaceContainer(img: 'https://cdn.pixabay.com/photo/2015/11/27/20/28/florence-1066314_960_720.jpg'),
                     
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceContainer extends StatelessWidget {
  final String img;
  const PlaceContainer({
    Key key, this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(.3), BlendMode.srcOver),
          image: NetworkImage(
              img),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          Text(
            "31 °",
            style: Theme.of(context)
                .textTheme
                .display1
                .apply(color: Colors.white, fontWeightDelta: 2),
          ),
          Text(
            "Sydney",
            style: Theme.of(context)
                .textTheme
                .headline
                .apply(color: Colors.white, fontWeightDelta: 2),
          )
        ],
      ),
    );
  }
}
