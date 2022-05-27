import 'package:base_flutter/config/Responsive.dart';
import 'package:base_flutter/helper_util.dart';
import 'package:base_flutter/providers/login_provider.dart';
import 'package:base_flutter/theme/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive responsive = Responsive.of(context);
    final loginForm = Provider.of<LoginFormProvider>(context);
    Color textColor = Colors.white;

    return Form(
      key: loginForm.formKey,
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(color: textColor, fontSize: responsive.pDiagonal(2)),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autocorrect: false,
            initialValue: 'noobmaster@gmail.com',
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'correo@gmail.com',
              labelText: 'Correo Electronico',
              prefixIcon: Icons.alternate_email_outlined,

            ),
            onChanged: ( value ) => loginForm.email = value,
            validator: ( value ) {

              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp  = RegExp(pattern);

              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'No es un Correo';
            },
          ),

          SizedBox( height: responsive.pHeigth(4.4)),

          TextFormField(
            style: TextStyle(color: textColor, fontSize: responsive.pDiagonal(2)),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autocorrect: false,
            obscureText: true,
            initialValue: '123456',
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.accessible_forward_outlined
            ),
            onChanged: ( value ) => loginForm.password = value,
            validator: ( value ) {

              return ( value != null && value.length >= 6)
                  ? null
                  : 'Debe tener 6 caracteres';

            },

          ),

          SizedBox( height: responsive.pHeigth(5.5)),

          MaterialButton(
              splashColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(responsive.pDiagonal(2.1))),
              disabledColor: Colors.grey,
              elevation: 5,
              color: const Color(0xff1c89b1),
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: responsive.pWidth(10), vertical: responsive.pHeigth(1.5)),
                child: Text(
                  loginForm.isLoading
                      ? 'Espere...'
                      : 'Ingresar',
                  style: TextStyle( color: Colors.white, fontSize: responsive.pDiagonal(1.5)),
                ),
              ),
              onPressed: loginForm.isLoading ? null : () async {

                FocusScope.of(context).unfocus();
                final authservice = Provider.of<AuthService>(context, listen: false);

                if( !loginForm.isValidForm() ) return;

                loginForm.isLoading = true;
                // await Future.delayed( const Duration(seconds: 2));

                final String? errorMessage = await authservice.login(loginForm.email, loginForm.password);

                if (errorMessage == null) {
                  Navigator.pushReplacementNamed(context, '/home');
                  //authservice.obtenerKudos();

                } else {
                  // print(errorMessage);
                  SnackbarService.showSnackbar(errorMessage);
                  loginForm.isLoading = false;
                }

              }

          )
        ],
      ),
    );
  }
}