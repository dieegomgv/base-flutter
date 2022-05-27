import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {

  late double _width;
  late double _heigth;
  late double _diagonal;

  double get width    => _width;
  double get heigth   => _heigth;
  double get diagonal => _diagonal;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive (BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    _width  = size.width;
    _heigth = size.height;

    _diagonal = math.sqrt(math.pow(_width, 2)+math.pow(_heigth, 2));
  }

  double pWidth ( double percent )    => _width * percent / 100;
  double pHeigth ( double percent )   => _heigth * percent / 100;
  double pDiagonal ( double percent ) => _diagonal * percent / 100;

}