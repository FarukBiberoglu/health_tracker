class FoodSuggestedServingModel {
  constructor({ serving_id, serving_description, metric_serving_description, metric_measure_amount, number_of_units }) {
    this.serving_id = serving_id;
    this.serving_description = serving_description;
    this.metric_serving_description = metric_serving_description;
    this.metric_measure_amount = metric_measure_amount;
    this.number_of_units = number_of_units;
  }

  static fromJson(json) {
    return new FoodSuggestedServingModel({
      serving_id: json["serving_id"],
      serving_description: json["serving_description"],
      metric_serving_description: json["metric_serving_description"],
      metric_measure_amount: json["metric_measure_amount"],
      number_of_units: json["number_of_units"],
    });
  }
}

export default FoodSuggestedServingModel;
