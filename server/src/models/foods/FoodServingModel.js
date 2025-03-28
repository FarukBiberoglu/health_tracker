class FoodServingModel {
  constructor({
    id,
    description,
    url,
    metric_serving_amount,
    metric_serving_unit,
    number_of_units,
    measurement_description,
    calories,
    carbohydrate,
    protein,
    fat,
    saturated_fat,
    polyunsaturated_fat,
    monounsaturated_fat,
    cholesterol,
    sodium,
    potassium,
    fiber,
    sugar,
    added_sugars,
    vitamin_a,
    vitamin_c,
    vitamin_d,
    calcium,
    iron,
  }) {
    this.id = id;
    this.description = description;
    this.url = url;
    this.metric_serving_amount = metric_serving_amount;
    this.metric_serving_unit = metric_serving_unit;
    this.number_of_units = number_of_units;
    this.measurement_description = measurement_description;
    this.calories = calories;
    this.carbohydrate = carbohydrate;
    this.protein = protein;
    this.fat = fat;
    this.saturated_fat = saturated_fat;
    this.polyunsaturated_fat = polyunsaturated_fat;
    this.monounsaturated_fat = monounsaturated_fat;
    this.cholesterol = cholesterol;
    this.sodium = sodium;
    this.potassium = potassium;
    this.fiber = fiber;
    this.sugar = sugar;
    this.added_sugars = added_sugars;
    this.vitamin_a = vitamin_a;
    this.vitamin_c = vitamin_c;
    this.vitamin_d = vitamin_d;
    this.calcium = calcium;
    this.iron = iron;
  }

  static fromJson(json) {
    return new FoodServingModel({
      id: json["serving_id"],
      description: json["serving_description"],
      url: json["serving_url"],
      metric_serving_amount: json["metric_serving_amount"] ? parseFloat(json["metric_serving_amount"]) : null,
      metric_serving_unit: json["metric_serving_unit"],
      number_of_units: json["number_of_units"] ? parseFloat(json["number_of_units"]) : null,
      measurement_description: json["measurement_description"],
      calories: json["calories"] ? parseFloat(json["calories"]) : null,
      carbohydrate: json["carbohydrate"] ? parseFloat(json["carbohydrate"]) : null,
      protein: json["protein"] ? parseFloat(json["protein"]) : null,
      fat: json["fat"] ? parseFloat(json["fat"]) : null,
      saturated_fat: json["saturated_fat"] ? parseFloat(json["saturated_fat"]) : null,
      polyunsaturated_fat: json["polyunsaturated_fat"] ? parseFloat(json["polyunsaturated_fat"]) : null,
      monounsaturated_fat: json["monounsaturated_fat"] ? parseFloat(json["monounsaturated_fat"]) : null,
      cholesterol: json["cholesterol"] ? parseFloat(json["cholesterol"]) : null,
      sodium: json["sodium"] ? parseFloat(json["sodium"]) : null,
      potassium: json["potassium"] ? parseFloat(json["potassium"]) : null,
      fiber: json["fiber"] ? parseFloat(json["fiber"]) : null,
      sugar: json["sugar"] ? parseFloat(json["sugar"]) : null,
      added_sugars: json["added_sugars"] ? parseFloat(json["added_sugars"]) : null,
      vitamin_a: json["vitamin_a"] ? parseFloat(json["vitamin_a"]) : null,
      vitamin_c: json["vitamin_c"] ? parseFloat(json["vitamin_c"]) : null,
      vitamin_d: json["vitamin_d"] ? parseFloat(json["vitamin_d"]) : null,
      calcium: json["calcium"] ? parseFloat(json["calcium"]) : null,
      iron: json["iron"] ? parseFloat(json["iron"]) : null,
    });
  }
}

export default FoodServingModel;
