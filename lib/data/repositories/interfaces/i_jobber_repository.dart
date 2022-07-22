import 'package:classified_app/data/models/jobber.dart';

abstract class IJobberRepository {
  Future<List<Jobber>> getAllJobbers();
}
