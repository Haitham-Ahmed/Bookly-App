import 'package:equatable/equatable.dart';

import 'list_price.model.dart';
import 'offer.model.dart';
import 'retail_price.model.dart';

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final ListPrice? listPrice;
  final RetailPrice? retailPrice;
  final String? buyLink;
  final List<Offer>? offers;

  const SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers,
  });

  factory SaleInfo.fromNo(Map<String, dynamic> json) => SaleInfo(
    country: json['country'] as String?,
    saleability: json['saleability'] as String?,
    isEbook: json['isEbook'] as bool?,
    listPrice:
        json['listPrice'] == null
            ? null
            : ListPrice.fromNo(json['listPrice'] as Map<String, dynamic>),
    retailPrice:
        json['retailPrice'] == null
            ? null
            : RetailPrice.fromNo(json['retailPrice'] as Map<String, dynamic>),
    buyLink: json['buyLink'] as String?,
    offers:
        (json['offers'] as List<dynamic>?)
            ?.map((e) => Offer.fromNo(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toNo() => {
    'country': country,
    'saleability': saleability,
    'isEbook': isEbook,
    'listPrice': listPrice?.toNo(),
    'retailPrice': retailPrice?.toNo(),
    'buyLink': buyLink,
    'offers': offers?.map((e) => e.toNo()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      country,
      saleability,
      isEbook,
      listPrice,
      retailPrice,
      buyLink,
      offers,
    ];
  }
}
