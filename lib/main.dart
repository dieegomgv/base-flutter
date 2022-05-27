import 'package:base_flutter/helper_util.dart';
import 'package:base_flutter/providers/login_provider.dart';
import 'package:base_flutter/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Landscape solo en vertical
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ( _ ) => LoginFormProvider()),
        ],
        child: const MyApp(),
      )
  );
}
const storage = FlutterSecureStorage();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      scaffoldMessengerKey: SnackbarService.messengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      // theme: Provider.of<ThemeProvider>(context).currentTheme
    );
  }

}

