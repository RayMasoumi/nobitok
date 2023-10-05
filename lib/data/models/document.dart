class Document {
  final int documentId;
  final int customerId;
  final bool? drugConsume;
  final bool? thyroidDisease;
  final bool? bloodPressure;
  final bool? smokingOrAlcoholConsumption;
  final bool? acutanConsumption;
  final bool? cardiovascularDisease;
  final bool? pregnancy;
  final bool? diabetes;
  final bool? breastFeeding;
  final bool? deformedWounds;
  final bool? herpes;
  final bool? radioTherapy;
  final bool? medicalAllergy;
  final bool? neuropsychiatricDiseases;
  final bool? hiv;
  final bool? hepatitis;
  final String? shockDuringInjection;
  final String? presenceOfMetalPlates;
  final bool? roaccutane;
  final bool? daccutane;
  final bool? tattoo;

  Document({
    required this.documentId,
    required this.customerId,
    this.drugConsume,
    this.thyroidDisease,
    this.bloodPressure,
    this.smokingOrAlcoholConsumption,
    this.acutanConsumption,
    this.cardiovascularDisease,
    this.pregnancy,
    this.diabetes,
    this.breastFeeding,
    this.deformedWounds,
    this.herpes,
    this.radioTherapy,
    this.medicalAllergy,
    this.neuropsychiatricDiseases,
    this.hiv,
    this.hepatitis,
    this.shockDuringInjection,
    this.presenceOfMetalPlates,
    this.roaccutane,
    this.daccutane,
    this.tattoo,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      documentId: json['id'] ?? 0,
      customerId: json['customerId'] ?? 0,
      drugConsume: json['drugConsume'] ?? false,
      thyroidDisease: json['thyroidDisease'] ?? false,
      bloodPressure: json['bloodPressure'] ?? false,
      smokingOrAlcoholConsumption: json['smokingOrAlcoholConsumption'] ?? false,
      acutanConsumption: json['acutanConsumption'] ?? false,
      cardiovascularDisease: json['cardiovascularDisease'] ?? false,
      pregnancy: json['pregnancy'] ?? false,
      diabetes: json['diabetes'] ?? false,
      breastFeeding: json['breastFeeding'] ?? false,
      deformedWounds: json['deformedWounds'] ?? false,
      herpes: json['herpes'] ?? false,
      radioTherapy: json['radioTherapy'] ?? false,
      medicalAllergy: json['medicalAllergy'] ?? false,
      neuropsychiatricDiseases: json['neuropsychiatricDiseases'] ?? false,
      hiv: json['hiv'] ?? false,
      hepatitis: json['hepatitis'] ?? false,
      shockDuringInjection: json['shockDuringInjection'] ?? '',
      presenceOfMetalPlates: json['presenceOfMetalPlates'] ?? '',
      roaccutane: json['roaccutane'] ?? false,
      daccutane: json['daccutane'] ?? false,
      tattoo: json['tatto'] ?? false,
    );
  }
}
