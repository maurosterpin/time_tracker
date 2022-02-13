import 'package:time_tracker/services/api_path.dart';
import 'package:time_tracker/services/firestore_service.dart';

import '../models/job.dart';


abstract class Database {
  Future <void> createJob(Job job);
  jobsStream() {}
}

class FirestoreDatabase implements Database {
  FirestoreDatabase({required this.uid});
  final String uid;

  final _service = FirestoreService.instance ;

  Future <void> createJob(Job job) => _service.setData(
    path: APIPath.job(uid, 'job_abc'), 
    data: job.toMap(),
    );

  Stream<List<Job>> jobsStream() => _service.collectionStream(
      path: APIPath.jobs(uid), 
      builder: (data) => Job.fromMap(data)
    );
}