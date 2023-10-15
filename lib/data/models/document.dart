class Document {
  final int documentId;
  final int customerId;
  bool drugConsume;
  bool thyroidDisease;
  bool bloodPressure;
  bool smokingOrAlcoholConsumption;
  bool acutanConsumption;
  bool cardiovascularDisease;
  bool pregnancy;
  bool diabetes;
  bool breastFeeding;
  bool deformedWounds;
  bool herpes;
  bool radioTherapy;
  bool medicalAllergy;
  bool neuropsychiatricDiseases;
  bool hiv;
  bool hepatitis;
  String shockDuringInjection;
  String presenceOfMetalPlates;
  bool roaccutane;
  bool daccutane;
  bool tattoo;

  Document({
    required this.documentId,
    required this.customerId,
    this.drugConsume = false,
    this.thyroidDisease = false,
    this.bloodPressure = false,
    this.smokingOrAlcoholConsumption = false,
    this.acutanConsumption = false,
    this.cardiovascularDisease = false,
    this.pregnancy = false,
    this.diabetes = false,
    this.breastFeeding = false,
    this.deformedWounds = false,
    this.herpes = false,
    this.radioTherapy = false,
    this.medicalAllergy = false,
    this.neuropsychiatricDiseases = false,
    this.hiv = false,
    this.hepatitis = false,
    this.shockDuringInjection = '',
    this.presenceOfMetalPlates = '',
    this.roaccutane = false,
    this.daccutane = false,
    this.tattoo = false,
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
