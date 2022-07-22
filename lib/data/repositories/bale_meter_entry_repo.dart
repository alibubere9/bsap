import 'package:classified_app/data/mock/mock_meter_entry.dart';
import 'package:classified_app/data/mock/mock_mtrEntrySection.dart';
import 'package:classified_app/data/models/meter_entry_model.dart';
import 'package:classified_app/data/models/mtr_entry_section.dart';
import 'package:classified_app/data/repositories/interfaces/i_entry_section_repo.dart';
import 'package:classified_app/data/repositories/interfaces/i_meter_entry_repo.dart';
import 'package:classified_app/utils/name_abbrievation.dart';

import 'interfaces/i_bale_meter_entry_repo.dart';

class BaleMeterEntryRepository extends IBaleMeterEntryRepository {
  @override
  List<MeterEntryModel> baleMeterEntryList() {
    return MockMeterEntry.meterEntry;
  }

  @override
  MeterEntryModel getBaleMeterEntryByBarcodeNumber(String barcodeNumber) {
    MeterEntryModel meterEntry = baleMeterEntryList().firstWhere(
      (element) => element.barCode == barcodeNumber,
      orElse: () => MeterEntryModel(
          barCode: barcodeNumber,
          meter: "",
          numberOfTP: "",
          remark: "",
          takhaNo: "",
          weight: ""),
    );
    return meterEntry;
  }
}
