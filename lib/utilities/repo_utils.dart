import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class RepoUtils {
  static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, bool>
      packageTransformer(String id) {
    return StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
        bool>.fromHandlers(handleData: (data, sink) {
      bool exists = data.docs.map((e) => e.id).contains(id);
      print(exists);
      sink.add(exists);
    });
  }
}
