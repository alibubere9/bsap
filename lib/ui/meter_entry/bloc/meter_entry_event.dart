part of 'meter_entry_bloc.dart';

abstract class MeterEntryEvent extends Equatable {
  const MeterEntryEvent();

  @override
  List<Object> get props => [];
}

class GetToSubmissionReviewPage extends MeterEntryEvent {
  final List<MeterEntryModel>? meterEntryList;

  GetToSubmissionReviewPage({this.meterEntryList});
}

class PreviousPageEvent extends MeterEntryEvent {
  final int? pageNumber;
  final List<MeterEntryModel>? meterEntryList;

  PreviousPageEvent({this.pageNumber, this.meterEntryList});
}

class NextPageEvent extends MeterEntryEvent {
  final int? pageNumber;
  final List<MeterEntryModel>? meterEntryList;

  NextPageEvent({this.pageNumber, this.meterEntryList});
}
