import 'package:flutter/material.dart';
import 'package:lumevents/HomePageScreens/allCitiesScreen.dart';
import 'package:lumevents/HomePageScreens/delhiNCRScreen.dart';
import 'package:lumevents/HomePageScreens/jaipurScreen.dart';
import 'package:lumevents/HomePageScreens/kolkataScreen.dart';
import 'package:lumevents/HomePageScreens/udaipurScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<String> _cities = [
  'All Cities',
  'Delhi NCR',
  'Jaipur',
  'Kolkata',
  'Udaipur',
];

class _HomePageState extends State<HomePage> {
  String selectedValue, _currentItemSelected = 'All Cities';
  Widget _currentScreenToShow = AllCitiesScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(

            backgroundColor: Color(0xFFFF4B8F),


            actions: <Widget>[
              Theme(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: _cities.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        child: Text(
                          dropDownStringItem,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'sf_pro'),
                        ),
                        value: dropDownStringItem,
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      setState(() {
                        _currentItemSelected = newValueSelected;
                        if (_currentItemSelected == _cities[0]) {
                          _currentScreenToShow = AllCitiesScreen();
                        } else if (_currentItemSelected == _cities[1]) {
                          _currentScreenToShow = DelhiNCRScreen();
                        } else if (_currentItemSelected == _cities[2]) {
                          _currentScreenToShow = JaipurScreen();
                        } else if (_currentItemSelected == _cities[3]) {
                          _currentScreenToShow = KolkataScreen();
                        } else if (_currentItemSelected == _cities[4]) {
                          _currentScreenToShow = UdaipurScreen();
                        }
                      });
                    },
                    value: _currentItemSelected,
                  ),
                ),
                data: ThemeData.dark(),
              ),
            ],
          ),
          body: _currentScreenToShow),
    );
  }
}
