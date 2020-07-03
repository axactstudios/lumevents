import 'DatabaseHelper.dart';

class WishlistModel {
  int id;
  String name, extras;

  WishlistModel({this.id, this.name, this.extras});

  WishlistModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    extras = map['extras'];
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnExtras: extras,
    };
  }
}
