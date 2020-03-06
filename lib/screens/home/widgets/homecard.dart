import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final Widget image;
  final String routeName;

  const HomeCard({Key key, this.title, this.image, this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(routeName),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 140,
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                image,
                Text(
                  title,
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
