import 'package:base_flutter/config/Responsive.dart';
import 'package:base_flutter/theme/constanst.dart';
import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {

  final Widget child;

  const ImageBackground({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Responsive responsive = Responsive.of(context);

    return SizedBox(
      width: double.infinity,
      height: double.infinity,

      child: Stack(
        children: [

          const _BackgroundColor(),

          Container(
            padding: EdgeInsets.only(
              top: responsive.pHeigth(8.5),
              left: responsive.pWidth(15),
              right: responsive.pWidth(15),
            ),
            child: const Image(
                image: AssetImage('assets/logo_iesoluciones.png')
            ),
          ),

          Container(
            padding: EdgeInsets.only(
              top: responsive.pHeigth(80),
              left: responsive.pWidth(38),
              right: responsive.pWidth(38),

            ),
            child: const Image(
                image: AssetImage('assets/logo_iesoluciones.png')
            ),
          ),

          child
        ],
      ),
    );
  }
}

class _BackgroundColor extends StatelessWidget {

  const _BackgroundColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: _colorBackgroundGradient(),
    );
  }

  BoxDecoration _colorBackgroundGradient() => const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColors.WHITE,
            CustomColors.WHITE
          ]
      )
  );
}
