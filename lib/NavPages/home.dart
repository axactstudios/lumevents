import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lumevents/HomePageScreens/allCitiesScreen.dart';
import 'package:lumevents/HomePageScreens/citySpecificScreen.dart';
import 'package:lumevents/theme.dart' as Theme;
import 'package:searchable_dropdown/searchable_dropdown.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<String> _cities = ['AllCities'];

class _HomePageState extends State<HomePage> {
  String selectedValue, _currentItemSelected = 'AllCities';
  Widget _currentScreenToShow = AllCitiesScreen();
  getCities() {
    DatabaseReference citiesref =
        FirebaseDatabase.instance.reference().child('Home');
    citiesref.once().then((DataSnapshot snap) {
      // ignore: non_constant_identifier_names
      var KEYS = snap.value.keys;
      // ignore: non_constant_identifier_names
      var DATA = snap.value;
      _cities.clear();
      for (var key in KEYS) {
        _cities.add(key);
      }
      setState(() {
        print(_cities.length);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCities();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'images/dreamthyeve.png',
                  scale: 26,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white.withOpacity(0.75),
                  ),
                  child: SearchableDropdown(
                    menuBackgroundColor: Colors.white,
                    iconEnabledColor: Theme.MyColors.themeColor,
                    iconDisabledColor: Theme.MyColors.themeColor,
                    items: _cities.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        child: Text(
                          dropDownStringItem,
                          style: TextStyle(
                              color: Theme.MyColors.themeColor,
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
                        if (_currentItemSelected == 'AllCities') {
                          _currentScreenToShow = AllCitiesScreen();
                        } else {
                          _currentScreenToShow =
                              CitySpecificScreen(_currentItemSelected);
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
