import 'package:flutter/material.dart';

import '../models/typeDesc.dart';

const double typeHeroHeight = 120;
const double typeHeroWidth = 80;

class TypeHero extends StatelessWidget {
  final TypeDesc typeDesc;

  final VoidCallback onTap;
  final double width;
  final double height;

  const TypeHero({Key key, this.typeDesc, this.onTap, this.width = typeHeroWidth, this.height = typeHeroHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return SizedBox(
    //width: width,
    //child:
    return Hero(
      tag: typeDesc.tag,
      child: Material(
        color: Colors.transparent,
        child: InkWell(onTap: onTap, child: Image.asset(typeDesc.png, width: width, height: height, semanticLabel: typeDesc.shortName)
//          SvgPicture.asset(
//              typeDesc.svg,
//              width: width,
//              height: height,
//              semanticsLabel: typeDesc.shortName,
//            )
            ),
      ),
    );
  }
}
