import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyscrapper/ForcastModel.dart';
import 'package:skyscrapper/HomeScreen.dart';
import 'package:skyscrapper/ThemeProvider.dart';
import 'package:textfield_search/textfield_search.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({super.key});
  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  List<String> CityNames = [
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Hyderabad',
    'Ahmedabad',
    'Chennai',
    'Kolkata',
    'Surat',
    'Pune',
    'Jaipur',
    'Lucknow',
    'Kanpur',
    'Nagpur',
    'Indore',
    'Thane',
    'Bhopal',
    'Visakhapatnam',
    'Pimpri-Chinchwad',
    'Patna',
    'Vadodara',
    'Ghaziabad',
    'Ludhiana',
    'Agra',
    'Nashik',
    'Faridabad',
    'Meerut',
    'Rajkot',
    'Kalyan-Dombivali',
    'Vasai-Virar',
    'Varanasi',
  ];
  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 160,
              child: Column(
                children: [
                  TextFieldSearch(
                    initialList: CityNames,
                    label: 'Select Your City',
                    controller: myController,
                    itemsInView: 10,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        City = myController.text.toString();
                        Provider.of<CityProvider>(context,listen: false).saveCity(City!);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: Text('Continue')
                  )
                ],
              ),
            )),
      ),
    );
  }
}
