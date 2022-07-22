import 'package:classified_app/data/mock/mock_mtrEntrySection.dart';
import 'package:classified_app/data/models/mtr_entry_section.dart';
import 'package:classified_app/data/repositories/interfaces/i_entry_section_repo.dart';

class EntrySectionRepository extends IEntrySectionRepository {
  @override
  List<EntrySectionModel> entrySectionList() {
    return MockEntrySection.entriesSection;
  }
}
