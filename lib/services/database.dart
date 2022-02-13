import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_tracker/services/api_path.dart';

import '../models/job.dart';


abstract class Database {
  Future <void> createJob(Job job);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid});
  final String uid;

  Future <void> createJob(Job job) => _setData(
    path: APIPath.job(uid, 'job_abc'), 
    data: job.toMap(),
    );

  Future<void> _setData({String? path, Map<String, dynamic>? data}) async {
    final reference = FirebaseFirestore.instance.doc(path!);
    print('$path: $data');
    await reference.set(data!);
  }

}