import 'package:equatable/equatable.dart';

class RetailPrice extends Equatable {
  final double? amount;
  final String? currencyCode;

  const RetailPrice({this.amount, this.currencyCode});

  factory RetailPrice.fromNo(Map<String, dynamic> json) => RetailPrice(
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
