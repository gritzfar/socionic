import 'package:flutter/material.dart';

import 'appConfig.dart';

//typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;

  //final RatingChangeCallback onRatingChanged;
  final Color color;
  final double size;

  //StarRating({this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color, this.size = 15});
  StarRating({this.starCount = 5, this.rating = .0, required this.color, this.size = 15});

  @override
  Widget build(BuildContext context) {
    if (AppConfig.of(context).internal) {
      return new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: new List.generate(
              starCount, (index) => buildStar(context, index)));
    }

    return Container();
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        size: this.size,
        color: Theme.of(context).backgroundColor,
        semanticLabel: "Качество",
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        size: this.size,
        color: color, // ?? Theme.of(context).buttonColor,
        semanticLabel: "Качество",
      );
    } else {
      icon = new Icon(
        Icons.star,
        size: this.size,
        color: color, // ?? Theme.of(context).buttonColor,
        semanticLabel: "Качество",
      );
    }

    return icon;

//    return new InkResponse(
//      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
//      child: icon,
//    );
  }
}
