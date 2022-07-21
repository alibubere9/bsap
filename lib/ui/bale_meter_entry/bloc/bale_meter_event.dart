part of 'bale_meter_bloc.dart';

abstract class BaleMeterEvent extends Equatable {
  const BaleMeterEvent();

  @override
  List<Object> get props => [];
}

class GetToBaleSubmissionReviewPage extends BaleMeterEvent {
  final List<MeterEntryModel>? meterEntryList;

  GetToBaleSubmissionReviewPage({this.meterEntryList});
}

class SendBaleBarcodeNumberEvent extends BaleMeterEvent {
  final int? index;
  final String? barcodeNumber;

  SendBaleBarcodeNumberEvent({this.index, this.barcodeNumber});
}

class BaleBarcodeAlreadyScannedEvent extends BaleMeterEvent {
  final String? snackBarMessage;

  BaleBarcodeAlreadyScannedEvent({this.snackBarMessage});
}
