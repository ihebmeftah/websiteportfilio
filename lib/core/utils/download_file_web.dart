import 'dart:js_interop';

import 'package:flutter/services.dart';
import 'package:web/web.dart' as web;

Future<void> downloadAsset({
  required String assetPath,
  required String filename,
}) async {
  final data = await rootBundle.load(assetPath);
  final bytes = Uint8List.view(
    data.buffer,
    data.offsetInBytes,
    data.lengthInBytes,
  );
  final blob = web.Blob(
    [bytes.toJS].toJS,
    web.BlobPropertyBag(type: 'application/pdf'),
  );
  final url = web.URL.createObjectURL(blob);
  final anchor = web.HTMLAnchorElement()
    ..href = url
    ..download = filename;
  web.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
  web.URL.revokeObjectURL(url);
}
