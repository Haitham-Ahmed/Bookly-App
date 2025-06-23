import 'package:equatable/equatable.dart';

class Pdf extends Equatable {
  final bool? isAvailable;

  const Pdf({this.isAvailable});

  factory Pdf.fromNo(Map<String, dynamic> json) =>
      Pdf(isAvailable: json['isAvailable'] as bool?);

  Map<String, dynamic> toNo() => {'isAvailable': isAvailable};

  @override
  List<Object?> get props => [isAvailable];
}
