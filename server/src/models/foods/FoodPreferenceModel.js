class FoodPreferenceModel {
  constructor({ id, name, value }) {
    this.id = id;
    this.name = name;
    this.value = value;
  }

  static fromJson(json) {
    return new FoodPreferenceModel({
      id: json["id"],
      name: json["name"],
      value: json["value"] == "1" ? true : json["value"] == "0" ? false : null,
    });
  }
}

export default FoodPreferenceModel;
