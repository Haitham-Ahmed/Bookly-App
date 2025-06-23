import 'package:equatable/equatable.dart';

class ListPrice extends Equatable {
  final double? amount;
  final String? currencyCode;

  const ListPrice({this.amount, this.currencyCode});

  factory ListPrice.fromNo(Map<String, dynamic> json) => ListPrice(
    amount: (json['amount'] as num?)?.toDouble(),
    currencyCode: json['currencyCode'] as String?,
  );

  Map<String, dynamic> toNo() => {
    'amount': amount,
    'currencyCode': currencyCode,
  };

  @override
  List<Object?> get props => [amount, currencyCode];
}
