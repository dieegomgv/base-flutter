import 'package:base_flutter/config/Responsive.dart';
import 'package:base_flutter/providers/login_provider.dart';
import 'package:base_flutter/theme/constanst.dart';
import 'package:base_flutter/theme/input_decorations.dart';
import 'package:base_flutter/view_model/login_viewmodel.dart';
import 'package:base_flutter/widgets/form_container.dart';
import 'package:base_flutter/widgets/image_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);


    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: ImageBackground(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox( height: responsive.pHeigth(35),),

                  FormContainer(
                      child: Column(
                        children: [

                          SizedBox( height: responsive.pHeigth(3.3) ),

                          ChangeNotifierProvider(
                            create: ( _ ) => LoginViewModel(),
                            child: const _LoginForm(),
                          )
                        ],
                      )
                  ),
                  SizedBox(height: responsive.pHeigth(7)),

                ],
              ),
            ),
          )
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive responsive = Responsive.of(context);
    final loginViewModel = Provider.of<LoginViewModel>(context);
    Color textColor = CustomColors.IE_BLUE;

    return Form(
      key: loginViewModel.formKey,
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(color: textColor, fontSize: responsive.pDiagonal(1.5)),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autocorrect: false,
            initialValue: 'reclutamiento@informaticaelectoral.com',
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'correo@gmail.com',
              labelText: 'Correo Electronico',
              prefixIcon: Icons.alternate_email_outlined,

            ),
            onChanged: ( value ) => loginViewModel.email = value,
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
            style: TextStyle(color: textColor, fontSize: responsive.pDiagonal(1.5)),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autocorrect: false,
            obscureText: true,
            initialValue: 'adminvacantes',
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.accessible_forward_outlined
            ),
            onChanged: ( value ) => loginViewModel.password = value,
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
              color: CustomColors.IE_BLUE,
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: responsive.pWidth(10), vertical: responsive.pHeigth(1.5)),
                child: Text(
                  loginViewModel.isLoading
                      ? 'Espere...'
                      : 'Ingresar',
                  style: TextStyle( color: CustomColors.WHITE, fontSize: responsive.pDiagonal(1.5)),
                ),
              ),
              onPressed: loginViewModel.isLoading ? null : () async {

                FocusScope.of(context).unfocus();
                final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);

                if( !loginViewModel.isValidForm() ) return;

                loginViewModel.isLoading = true;

                Provider.of<LoginViewModel>(context, listen: false).doLogin(loginViewModel.email, loginViewModel.password);
                print("DO LOGIN ${loginViewModel.response}");

                // await Future.delayed( const Duration(seconds: 2));
                //final String? errorMessage = await authservice.login(loginForm.email, loginForm.password);
                //
                // if (errorMessage == null) {
                //   Navigator.pushReplacementNamed(context, '/home');
                //   //authservice.obtenerKudos();
                //
                // } else {
                //   // print(errorMessage);
                //   SnackbarService.showSnackbar(errorMessage);
                //   loginForm.isLoading = false;
                // }

              }

          )
        ],
      ),
    );
  }
}