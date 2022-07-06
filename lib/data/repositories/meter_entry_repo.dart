import 'package:classified_app/data/mock/mock_meter_entry.dart';
import 'package:classified_app/data/mock/mock_mtrEntrySection.dart';
import 'package:classified_app/data/models/meter_entry_model.dart';
import 'package:classified_app/data/models/mtr_entry_section.dart';
import 'package:classified_app/data/repositories/interfaces/i_entry_section_repo.dart';
import 'package:classified_app/data/repositories/interfaces/i_meter_entry_repo.dart';

class MeterEntryRepository extends IMeterEntryRepository {

  @override
  List<MeterEntryModel> meterEntryList() {
    return MockMeterEntry.meterEntry;
  }
}
