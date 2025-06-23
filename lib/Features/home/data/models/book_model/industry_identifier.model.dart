import 'package:equatable/equatable.dart';

class IndustryIdentifier extends Equatable {
  final String? type;
  final String? identifier;

  const IndustryIdentifier({this.type, this.identifier});

  factory IndustryIdentifier.fromNo(Map<String, dynamic> json) {
    return IndustryIdentifier(
      type: json['type'] as String?,
      identifier: json['identifier'] as String?,
    );
  }

  Map<String, dynamic> toNo() => {'type': type, 'identifier': identifier};

  @override
  List<Object?> get props => [type, identifier];
}
