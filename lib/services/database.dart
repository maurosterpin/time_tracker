import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_tracker/services/api_path.dart';

import '../models/job.dart';


abstract class Database {
  Future <void> createJob(Job job);
  jobsStream() {}
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid});
  final String uid;

  Future <void> createJob(Job job) => _setData(
    path: APIPath.job(uid, 'job_abc'), 
    data: job.toMap(),
    );

  Stream<List<Job>> jobsStream() {
    final path = APIPath.jobs(uid);
    final reference = FirebaseFirestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.docs.map(
      (snapshot) => Job.fromMap(snapshot.data()),
    ).toList());
  }

  Future<void> _setData({String? path, Map<String, dynamic>? data}) async {
    final reference = FirebaseFirestore.instance.doc(path!);
    print('$path: $data');
    await reference.set(data!);
  }

}