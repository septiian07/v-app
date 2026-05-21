import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Wrapper around [FlutterSecureStorage] providing a clean API
/// for encrypted key-value persistence.
@lazySingleton
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService()
      : _storage = const FlutterSecureStorage(
          aOptions: AndroidOptions(encryptedSharedPreferences: true),
        );

  /// Read a value by [key]. Returns `null` if not found.
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  /// Write a [value] for the given [key].
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Delete a single entry by [key].
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Wipe all stored values.
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  /// Check if a [key] exists in storage.
  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }

  /// Write a JSON-serializable object as a string.
  ///
  /// Convenience method for storing objects that implement `toJson()`.
  Future<void> writeJson(String key, dynamic object) async {
    final jsonString = json.encode(object);
    await write(key, jsonString);
  }

  /// Read and deserialize a JSON string back into an object.
  ///
  /// Returns `null` if not found. Use [fromJson] to deserialize.
  /// Example: `await storage.readJson<MyModel>('key', MyModel.fromJson)`
  Future<T?> readJson<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final jsonString = await read(key);
    if (jsonString == null || jsonString.isEmpty) {
      return null;
    }

    try {
      final decoded = json.decode(jsonString) as Map<String, dynamic>;
      return fromJson(decoded);
    } catch (e) {
      // Return null if deserialization fails
      return null;
    }
  }

  /// Read and deserialize a JSON list.
  ///
  /// Example: `await storage.readJsonList<MyModel>('key', MyModel.fromJson)`
  Future<List<T>> readJsonList<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final jsonString = await read(key);
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    try {
      final decoded = json.decode(jsonString) as List<dynamic>;
      return decoded
          .map((item) => fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Return empty list if deserialization fails
      return [];
    }
  }
}
