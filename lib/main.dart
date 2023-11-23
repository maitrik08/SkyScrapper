import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyscrapper/ForcastModel.dart';
import 'package:skyscrapper/SplashScreen.dart';
import 'package:skyscrapper/ThemeProvider.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark// status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDark = prefs.getBool('appTheme') ?? false;
  final cityProvider = CityProvider();
  await cityProvider.loadCity();
  print(City);
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<CityProvider>.value(value: cityProvider),
          ChangeNotifierProvider(create: (context) => ThemeProvider(isDark: isDark),),
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sky Screpper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: (Provider.of<ThemeProvider>(context).isDark) ? ThemeMode.dark : ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
