import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skyscrapper/ForcastModel.dart';
import 'package:skyscrapper/SelectCity.dart';
import 'dart:developer' as developer;


import 'ThemeProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ForcastModel? MODEL;
  String responce = '';
  List<String> DateList = [];
  List<String> DayList = [];
  List<String> TimeList = [];
  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }
  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;
    print(_connectionStatus);
    if (_connectionStatus == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "You're Offline",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: CallApI(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
             if(MODEL != null){
               return Scaffold(
                 drawer: Drawer(
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 25),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           InkWell(
                               onTap: () {
                                 Navigator.of(context).push(MaterialPageRoute(
                                     builder: (context) => SelectCity()));
                               },
                               child: Text('Change City',style: TextStyle(fontSize: 18),)
                           ),
                           Divider()
                         ],
                       ),
                     )),
                 appBar: AppBar(
                   title: Text(
                     City,
                   ),
                   actions: [
                     IconButton(
                       onPressed: () {
                         Provider.of<ThemeProvider>(context, listen: false).changeTheme();
                       },
                       icon: (Provider.of<ThemeProvider>(context).isDark)
                           ?  Icon(Icons.mode_night)
                           :  Icon(Icons.light_mode_rounded),
                     ),
                   ],
                 ),
                 body: SingleChildScrollView(
                   child: Column(
                     //crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Image.network('https://static.vecteezy.com/system/resources/previews/020/716/723/original/3d-minimal-weather-forecast-concept-partly-cloudy-in-the-morning-weather-icon-3d-illustration-png.png',height: 200,width: 200,fit: BoxFit.fill,),
                       //SizedBox(height: 150),
                       Align(
                         alignment: Alignment.centerLeft,
                         child: Padding(
                           padding:  EdgeInsets.symmetric(horizontal: 20),
                           child: Text(
                             '${MODEL!.current.tempC.toInt()}°C',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 55,
                             ),
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Image.network(
                               'https:' + MODEL!.current.condition.icon,
                               height: 40,
                               width: 40,
                               fit: BoxFit.fill,
                             ),
                             Text(
                               MODEL!.current.condition.text,
                               style: TextStyle(fontSize: 18),
                             )
                           ],
                         ),
                       ),
                       SizedBox(height: 5),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Today    ${DayList[0]}'),
                             Text('${MODEL!.forecast.forecastday[0].day.maxtempC.round()}-${MODEL!.forecast.forecastday[0].day.mintempC.round()}°C')
                           ],
                         ),
                       ),
                       SizedBox(height: 5),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Divider(),
                       ),
                       SingleChildScrollView(
                         scrollDirection: Axis.horizontal,
                         child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 25),
                           child: Row(
                             children: [
                           for(int i = 0 ; i < MODEL!.forecast.forecastday[0].hour.length;i++)...[
                                Column(
                                  children: [
                                    Text(TimeList[i]),
                                    Image.network(
                                      'https:' + MODEL!.forecast.forecastday[0].hour[i].condition.icon,
                                      height: 37,
                                      width: 37,
                                      fit: BoxFit.fill,
                                    ),
                                    Text('${MODEL!.forecast.forecastday[0].hour[i].tempC.round()}°C'),
                                  ],
                                ),
                             SizedBox(width: 25)
                           ]
                             ],
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Divider(),
                       ),
                       SizedBox(height: 10),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Column(
                           children: [
                             for(int i = 0 ; i < MODEL!.forecast.forecastday.length;i++)...[
                               i!=0?Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Expanded(
                                     flex: 5,
                                     child: Row(
                                       children: [
                                         Text(DateList[i]),
                                         SizedBox(width: 45,),
                                         Text(DayList[i]),
                                       ],
                                     ),
                                   ),
                                   Spacer(),
                                   Expanded(
                                     flex: 7,
                                       child:Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Image.network(
                                             'https:' + MODEL!.forecast.forecastday[i].day.condition.icon,
                                             height: 30,
                                             width: 30,
                                             fit: BoxFit.fill,
                                           ),
                                           Text('${MODEL!.forecast.forecastday[i].day.maxtempC.round()}-${MODEL!.forecast.forecastday[i].day.mintempC.round()}°C')
                                         ],
                                       )
                                   )
                                 ],
                               ):SizedBox()
                               ]
                           ],
                         ),
                       ),
                       SizedBox(height: 10),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Divider(),
                       ),
                       SizedBox(
                         height: 187,
                         child: Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 20),
                           child: GridView(
                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 1.24),
                               shrinkWrap:  true,
                             children: [
                               weather(iconUrl: 'https://cdn-icons-png.flaticon.com/128/6218/6218295.png', Name: 'Temperature Felt \n${MODEL!.current.feelslikeC.round()}°C'),
                               weather(iconUrl: 'https://cdn-icons-png.flaticon.com/128/6566/6566341.png', Name: 'Humidility ${MODEL!.current.humidity}%'),
                               weather(iconUrl: 'https://cdn-icons-png.flaticon.com/128/685/685902.png', Name: 'Visibility ${MODEL!.current.visKm.round()} km'),
                               weather(iconUrl: 'https://cdn-icons-png.flaticon.com/128/5065/5065210.png', Name: 'NW ${MODEL!.current.windKph.round()}'),
                               weather(iconUrl: 'https://cdn-icons-png.flaticon.com/128/8117/8117332.png', Name: 'UV ${MODEL!.current.uv.round()}'),
                               weather(iconUrl: 'https://cdn-icons-png.flaticon.com/128/8299/8299106.png', Name: 'Air Pressure \n${MODEL!.current.pressureIn.round()} hPa'),
                             ],
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
               );
             }
             else {
               // Handle the case where MODEL is null
               return Text('Data not available');
             }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return Container(
              color: Colors.green,
              height: 300,
            );
          },
        ),
      ),
    );
  }

  Future CallApI() async {
    var url = Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=4b0bdd306a2e4823b3835517232011&q=$City&days=6&aqi=no&alerts=no');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      responce = response.body;
      LoadJson();
      Date();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    print(response.body);
  }

  Future LoadJson() async {
    Map<String, dynamic> jsonData = jsonDecode(responce);
    Map<String, dynamic> locationData = jsonData['location'];
    Location location = Location.fromJson(locationData);
    Map<String, dynamic> currentData = jsonData['current'];
    Current current = Current.fromJson(currentData);
    Map<String, dynamic> forcastData = jsonData['forecast'];
    Forecast forecast = Forecast.fromJson(forcastData);
    ForcastModel model = ForcastModel(location: location, current: current, forecast: forecast);
    MODEL = model;
  }
  void Date(){
    for(int i = 0 ; i < MODEL!.forecast.forecastday[0].hour.length;i++){
      DateTime dateTime = DateTime.parse(MODEL!.forecast.forecastday[0].hour[i].time);
      String formattedTime = DateFormat('ha').format(dateTime);
      TimeList.add(formattedTime);
    }
    for(int i = 0 ; i < MODEL!.forecast.forecastday.length;i++){
      DateTime dateTime = DateTime.parse(MODEL!.forecast.forecastday[i].date);
      String dayName = DateFormat('EE').format(dateTime);
      String formattedString = "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}";
      DateList.add(formattedString);
      DayList.add(dayName);
    }
  }
  Widget weather({required String iconUrl, required String Name}){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(iconUrl,height: 30,width: 30,fit: BoxFit.fill,),
        ),
        Text(
            Name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12
          ),
        )
      ],
    );
  }
}
//Text('${MODEL!.current.temp_c.round()}')
