import 'dart:io';

String fixture(String filename) =>
    File('test/helper/fixtures/$filename').readAsStringSync();
