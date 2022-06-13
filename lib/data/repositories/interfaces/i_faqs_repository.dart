import 'package:classified_app/data/models/faqs_model.dart';

abstract class IFaqsRepository{
  Future<List<FaqsModel>> getFaqsList ();
}