import 'package:base_flutter/config/Responsive.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {

  final Widget child;

  const FormContainer({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Responsive responsive = Responsive.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.pWidth(5)),
      child: Container(
        padding: EdgeInsets.all(responsive.pDiagonal(1.5)),
        width: double.infinity,
        child: child,
      ),
    );
  }
}