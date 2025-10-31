import 'dart:io';

class FetchAllFolders {
  static List<String> _files = [];
  static Future<List<String>> fetchAllDeviceFolders() async {
    final dir = Directory('/storage/emulated/0/');
    if (dir.existsSync()) {
      final items = dir.listSync();
      _files = items
          .where((item) => FileSystemEntity.isDirectorySync(item.path))
          .map((e) => e.path)
          .toList();
    }
    return _files;
  }

  static Future<List<String>> fetchAllFromFolders(String folderPath) async {
    final dir = Directory(folderPath);

    if (dir.existsSync()) {
      final items = dir.listSync();
      _files = items
          .where((item) => FileSystemEntity.isDirectorySync(item.path))
          .map((e) => e.path)
          .toList();
    }
    return _files;
  }
}
