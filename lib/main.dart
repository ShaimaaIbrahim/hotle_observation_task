import 'package:flutter/material.dart';
import 'package:hotel_observation_assignment/routes/AppRouter.dart';
import 'package:hotel_observation_assignment/routes/RoutesNames.dart';
import 'package:hotel_observation_assignment/services/navigation_services.dart';
import 'package:hotel_observation_assignment/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hotel',
          theme: ThemeData(
              primarySwatch: Colors.red,
              textTheme: GoogleFonts.cairoTextTheme(
                Theme.of(context).textTheme,
              ),
              checkboxTheme: CheckboxThemeData(
                fillColor: MaterialStateProperty.all(additionColor),
              )),
          initialRoute: RouteName.SPLASH,
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: AppRouter.generateRoute,
        ));
  }
}
