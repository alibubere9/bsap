import 'package:classified_app/data/mock/mock_jobbers.dart';
import 'package:classified_app/data/models/jobber.dart';
import 'package:classified_app/data/repositories/interfaces/i_jobber_repository.dart';

class JobberRepository implements IJobberRepository {
  @override
  Future<List<Jobber>> getAllJobbers() async {
    return MockJobbers.jobbers;
  }
}
