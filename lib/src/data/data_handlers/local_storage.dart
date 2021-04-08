import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//CRUD operations for local database
abstract class LocalStorage {
  Future<void> create(String table, Map<String, dynamic> map);
  Future<List<Map<String, dynamic>>> read(String table);
  Future<void> update(String table, Map<String, dynamic> map);
  Future<void> delete(String table);
}

//Flutter secure storage implementation of LocalStorage class
class FlutterSecureStorageDatabase implements LocalStorage {
  final _storage = FlutterSecureStorage();

  @override
  Future<void> create(String table, Map<String, dynamic> map) async {
    var contains = await _storage.containsKey(key: '$table.count');
    if (!contains) {
      var mapToWrite = jsonEncode(map);
      await _storage.write(key: '$table.1', value: mapToWrite);
      await _storage.write(key: '$table.count', value: 1.toString());
    } else {
      var count = int.parse(await _storage.read(key: '$table.count'));
      var mapToWrite = jsonEncode(map);
      await _storage.write(key: '$table.${count++}', value: mapToWrite);
      await _storage.write(key: '$table.count', value: (count++).toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> read(String table) async {
    var contains = await _storage.containsKey(key: '$table.count');
    List<Map<String, dynamic>> list;
    if (!contains)
      throw Exception('Table does not exist');
    else {
      var count = int.parse(await _storage.read(key: '$table.count'));
      for (int i = 1; i <= count; i++) {
        list.add(jsonDecode(await _storage.read(key: '$table.$count')));
      }

      return list;
    }
  }

  @override
  Future<void> update(String table, Map<String, dynamic> map) async {
    var contains = await _storage.containsKey(key: '$table.count');
    if (!contains)
      throw Exception('Table does not exist');
    else {
      var mapToWrite = jsonEncode(map);
      await _storage.write(key: '$table.1', value: mapToWrite);
    }
  }

  @override
  Future<void> delete(String table) async {
    var contains = await _storage.containsKey(key: '$table.count');
    if (!contains)
      throw Exception('Table does not exist');
    else {
      var count = int.parse(await _storage.read(key: '$table.count'));
      for (int i = 1; i <= count; i++) {
        await _storage.delete(key: '$table.$count');
        await _storage.delete(key: '$table.count');
      }
    }
  }
}
