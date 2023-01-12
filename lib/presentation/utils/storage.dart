import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<String> prepareSaveDir({required TargetPlatform platform}) async {
  final localPath = (await findLocalPath(platform: platform))!;

  debugPrint(localPath);
  final savedDir = Directory(localPath);
  bool hasExisted = await savedDir.exists();
  if (!hasExisted) {
    savedDir.create();
  }
  return localPath;
}

Future<String?> findLocalPath({required TargetPlatform platform}) async {
  if (platform == TargetPlatform.android) {
    return "/sdcard/download/";
  } else {
    var directory = await getApplicationDocumentsDirectory();
    return '${directory.path}${Platform.pathSeparator}Download';
  }
}
