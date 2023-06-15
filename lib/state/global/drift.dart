
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/drift.dart';

part 'generated/drift.g.dart';

@Riverpod(keepAlive: true)
MyDatabase myDatabase(MyDatabaseRef ref) {
  return MyDatabase();
}
