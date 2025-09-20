import "package:injectable/injectable.dart";
import "package:shared_preferences/shared_preferences.dart";

@LazySingleton()
class SharedPref {
  SharedPref(this._pref);

  final String _token = "token";
  final SharedPreferences _pref;

  String getToken() {
    final token = _pref.getString(_token);
    return token is String ? token : "";
  }

  Future<void> setToken(String sessionToken) =>
      _pref.setString(_token, sessionToken);

  Future<void> deleteToken() => _pref.remove(_token);

  List<String>? getInitiallyVisibleColumns(String columnName) =>
      _pref.getStringList(columnName);

  Future<void> setInitiallyVisibleColumns(
    String columnName,
    List<String> visibleColumns,
  ) => _pref.setStringList(columnName, visibleColumns);
}
