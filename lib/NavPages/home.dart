import 'package:flutter/material.dart';
import 'package:lumevents/HomePageScreens/allCitiesScreen.dart';
import 'package:lumevents/HomePageScreens/citySpecificScreen.dart';

import 'package:searchable_dropdown/searchable_dropdown.dart';

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
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFFFF4B8F),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white.withOpacity(0.75),
                  ),
                  child: SearchableDropdown(
                    menuBackgroundColor: Colors.white,
                    iconEnabledColor: Color(0xFFFF124D),
                    iconDisabledColor: Color(0xFFFF124D),
                    items: _cities.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        child: Text(
                          dropDownStringItem,
                          style: TextStyle(
                              color: Color(0xFFFF124D),
                              fontFamily: 'nunito',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
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
                          _currentScreenToShow = CitySpecificScreen("DelhiNCR");
                        } else if (_currentItemSelected == _cities[2]) {
                          _currentScreenToShow = CitySpecificScreen(_cities[2]);
                        } else if (_currentItemSelected == _cities[3]) {
                          _currentScreenToShow = CitySpecificScreen(_cities[3]);
                        } else if (_currentItemSelected == _cities[4]) {
                          _currentScreenToShow = CitySpecificScreen(_cities[4]);
                        }
                      });
                    },
                    value: _currentItemSelected,
                  ),
                ),
              ],
            ),
          ),
          body: _currentScreenToShow),
    );
  }
}
