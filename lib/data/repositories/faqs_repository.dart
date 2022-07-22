import 'dart:convert';

import 'package:classified_app/data/models/faqs_model.dart';
import 'package:classified_app/data/repositories/interfaces/i_faqs_repository.dart';
import 'package:classified_app/network/advance_http_handler/execution_handler.dart';

class FaqsRepository extends IFaqsRepository {
  final ExecutionHandler _handler;

  FaqsRepository(this._handler);

  Future<List<FaqsModel>> getFaqsList() async {
    String response = await _handler.getFaqsList();
    List<FaqsModel> faqsList = _convertToModel(response);
    return faqsList;
  }

  List<FaqsModel> _convertToModel(String response) {
    List faqs = jsonDecode(response)["FAQ"];
    List<FaqsModel> _faqsList = [];
    faqs.forEach((element) {
      _faqsList.add(FaqsModel.fromMap(element));
    });
    return _faqsList;
  }
}
