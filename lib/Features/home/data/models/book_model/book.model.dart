import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

import 'access_info.model.dart';
import 'sale_info.model.dart';
import 'search_info.model.dart';
import 'volume_info.model.dart';

class Book extends BookEntity {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

   Book({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    required this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
      bookId: id!,
      image: volumeInfo.imageLinks?.thumbnail ?? '',
      authorName: volumeInfo.authors?.first ?? 'No Name',
      price: 0.0,
      rating: volumeInfo.averageRating,
      title: volumeInfo.title!,
  );

  factory Book.fromNo(Map<String, dynamic> json) => Book(
    kind: json['kind'] as String?,
    id: json['id'] as String?,
    etag: json['etag'] as String?,
    selfLink: json['selfLink'] as String?,
    volumeInfo: VolumeInfo.fromNo(json['volumeInfo'] as Map<String, dynamic>),
    saleInfo:
        json['saleInfo'] == null
            ? null
            : SaleInfo.fromNo(json['saleInfo'] as Map<String, dynamic>),
    accessInfo:
        json['accessInfo'] == null
            ? null
            : AccessInfo.fromNo(json['accessInfo'] as Map<String, dynamic>),
    searchInfo:
        json['searchInfo'] == null
            ? null
            : SearchInfo.fromNo(json['searchInfo'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toNo() => {
    'kind': kind,
    'id': id,
    'etag': etag,
    'selfLink': selfLink,
    'volumeInfo': volumeInfo?.toNo(),
    'saleInfo': saleInfo?.toNo(),
    'accessInfo': accessInfo?.toNo(),
    'searchInfo': searchInfo?.toNo(),
  };

  @override
  List<Object?> get props {
    return [
      kind,
      id,
      etag,
      selfLink,
      volumeInfo,
      saleInfo,
      accessInfo,
      searchInfo,
    ];
  }
}
