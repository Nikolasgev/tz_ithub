class Currency {
  final String id;
  final String numCode;
  final String charCode;
  final int nominal;
  final String name;
  final double value;
  final double previous;

  Currency({
    required this.id,
    required this.numCode,
    required this.charCode,
    required this.nominal,
    required this.name,
    required this.value,
    required this.previous,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['ID'],
      numCode: json['NumCode'],
      charCode: json['CharCode'],
      nominal: json['Nominal'],
      name: json['Name'],
      value: json['Value'],
      previous: json['Previous'],
    );
  }
}
