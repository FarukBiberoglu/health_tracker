import FoodNutritionalContentModel from "./FoodNutritionalContentModel.js";

class FoodEatenModel {
  constructor({
    singular_description,
    plural_description,
    units,
    metric_description,
    total_metric_amount,
    per_unit_metric_amount,
    total_nutritional_content,
  }) {
    this.singular_description = singular_description;
    this.plural_description = plural_description;
    this.units = units;
    this.metric_description = metric_description;
    this.total_metric_amount = total_metric_amount;
    this.per_unit_metric_amount = per_unit_metric_amount;
    this.total_nutritional_content = total_nutritional_content;
  }

  static fromJson(json) {
    return new FoodEatenModel({
      singular_description: json["singular_description"],
      plural_description: json["plural_description"],
      units: json["units"],
      metric_description: json["metric_description"],
      total_metric_amount: json["total_metric_amount"],
      per_unit_metric_amount: json["per_unit_metric_amount"],
      total_nutritional_content: json["total_nutritional_content"]
        ? FoodNutritionalContentModel.fromJson(json["total_nutritional_content"])
        : null,
    });
  }
}

export default FoodEatenModel;
