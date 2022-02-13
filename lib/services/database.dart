import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_tracker/services/api_path.dart';

import '../models/job.dart';


abstract class Database {
  Future <void> createJob(Job job);
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid});
  final String uid;

  Future <void> createJob(Job job) async {
    final path = APIPath.job(uid, 'job_abc');
    final documentReference = FirebaseFirestore.instance.doc(path);
    await documentReference.set(job.toMap());
  }

}