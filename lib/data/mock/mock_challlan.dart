import '../models/challan_model.dart';

class MockChallan {
  static final List<ChallanModel> _challans = [
    ChallanModel.fromMap({
      "id": 1,
      "challan_no": 123456789,
      "party": "Ali Bubere",
      "item": "item name",
      "desgin": "Design",
      "pcs": 50
    }),
    ChallanModel.fromMap({
      "id": 1,
      "challan_no": 123456789,
      "party": "Ali Bubere",
      "item": "item name",
      "desgin": "Design",
      "pcs": 50
    }),
    ChallanModel.fromMap({
      "id": 1,
      "challan_no": 123456789,
      "party": "Ali Bubere",
      "item": "item name",
      "desgin": "Design",
      "pcs": 50
    }),
  ];

  MockChallan._();
  static List<ChallanModel> get challans => _challans;
}
