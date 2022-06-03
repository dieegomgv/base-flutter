import 'package:base_flutter/config/Responsive.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Responsive responsive = Responsive.of(context);

    return Stack(
      children: [

        Hero(
          tag: 'kudosImage',
          child: Container(
              padding: EdgeInsets.only(
                  top: responsive.pHeigth(2),
                  left: responsive.pWidth(15),
                  right: responsive.pWidth(15)
              ),
              child: Image.asset('assets/KUDOS.png')
          ),
        )
      ],
    );
  }
}