class PriceDetails {
  late List<DetailCurrent> current;

  PriceDetails({required this.current});

  PriceDetails.fromMap(Map<String, dynamic> map) {
    this.current = [];
    (map["current"])
        .forEach((element) => this.current.add(DetailCurrent.FromMap(element)));
  }

  Map<String, dynamic> toMap() {
    List<Map> list = [];
    this.current.forEach((element) => list.add(element.toMap()));
    Map<String, dynamic> map = {
      "current": list,
    };
    return map;
  }
}

class DetailCurrent {
  late int value;

  DetailCurrent({required this.value});

  DetailCurrent.FromMap(Map<String, dynamic> map) {
    this.value = map["value"];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "value": this.value,
    };
    return map;
  }
}
