import 'package:classified_app/data/models/jobber.dart';

class MockJobbers {
  MockJobbers._();

  static List<Jobber> get jobbers =>
      List.generate(5, (index) => Jobber(id: index + 1, name: "Jobber $index"));
}
