// To parse this JSON data, do
//
//     final pendingOrders = pendingOrdersFromJson(jsonString);

import 'dart:convert';

List<PendingOrders> pendingOrdersFromJson(String str) => List<PendingOrders>.from(json.decode(str).map((x) => PendingOrders.fromJson(x)));

String pendingOrdersToJson(List<PendingOrders> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendingOrders {
    PendingOrders({
        this.variants,
        this.id,
        this.isVariants,
        this.nameE,
        this.nameH,
        this.img,
        this.weight,
        this.rate,
    });

    List<Variant>? variants;
    String? id;
    bool? isVariants;
    String? nameE;
    String? nameH;
    String? img;
    Weight? weight;
    int? rate;

    factory PendingOrders.fromJson(Map<String, dynamic> json) => PendingOrders(
        variants: List<Variant>.from(json["Variants"].map((x) => Variant.fromJson(x))),
        id: json["ID"],
        isVariants: json["IsVariants"],
        nameE: json["NameE"],
        nameH: json["NameH"],
        img: json["Img"],
        weight: weightValues.map[json["Weight"]],
        rate: json["Rate"],
    );

    Map<String, dynamic> toJson() => {
        "Variants": List<dynamic>.from(variants!.map((x) => x.toJson())),
        "ID": id,
        "IsVariants": isVariants,
        "NameE": nameE,
        "NameH": nameH,
        "Img": img,
        "Weight": weightValues.reverse![weight!],
        "Rate": rate,
    };
}

class Variant {
    Variant({
        this.weight,
        this.rate,
    });

    Weight? weight;
    int? rate;

    factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        weight: weightValues.map[json["Weight"]],
        rate: json["Rate"],
    );

    Map<String, dynamic> toJson() => {
        "Weight": weightValues.reverse![weight!],
        "Rate": rate,
    };
}

enum Weight { THE_250_GM, THE_500_GM, THE_1_KG }

final weightValues = EnumValues({
    "1 kg": Weight.THE_1_KG,
    "250 gm": Weight.THE_250_GM,
    "500 gm": Weight.THE_500_GM
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
