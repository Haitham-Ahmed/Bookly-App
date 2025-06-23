import 'package:equatable/equatable.dart';

import 'list_price.model.dart';
import 'retail_price.model.dart';

class Offer extends Equatable {
  final int? finskyOfferType;
  final ListPrice? listPrice;
  final RetailPrice? retailPrice;
  final bool? giftable;

  const Offer({
    this.finskyOfferType,
    this.listPrice,
    this.retailPrice,
    this.giftable,
  });

  factory Offer.fromNo(Map<String, dynamic> json) => Offer(
    finskyOfferType: json['finskyOfferType'] as int?,
    listPrice:
        json['listPrice'] == null
            ? null
            : ListPrice.fromNo(json['listPrice'] as Map<String, dynamic>),
    retailPrice:
        json['retailPrice'] == null
            ? null
            : RetailPrice.fromNo(json['retailPrice'] as Map<String, dynamic>),
    giftable: json['giftable'] as bool?,
  );

  Map<String, dynamic> toNo() => {
    'finskyOfferType': finskyOfferType,
    'listPrice': listPrice?.toNo(),
    'retailPrice': retailPrice?.toNo(),
    'giftable': giftable,
  };

  @override
  List<Object?> get props {
    return [finskyOfferType, listPrice, retailPrice, giftable];
  }
}
