class FoodNutritionalContentModel {
  constructor({
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
    vitamin_a,
    vitamin_c,
    calcium,
    iron,
  }) {
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
    this.vitamin_a = vitamin_a;
    this.vitamin_c = vitamin_c;
    this.calcium = calcium;
    this.iron = iron;
  }

  static fromJson(json) {
    return new FoodNutritionalContentModel({
      calories: json["calories"],
      carbohydrate: json["carbohydrate"],
      protein: json["protein"],
      fat: json["fat"],
      saturated_fat: json["saturated_fat"],
      polyunsaturated_fat: json["polyunsaturated_fat"],
      monounsaturated_fat: json["monounsaturated_fat"],
      cholesterol: json["cholesterol"],
      sodium: json["sodium"],
      potassium: json["potassium"],
      fiber: json["fiber"],
      sugar: json["sugar"],
      vitamin_a: json["vitamin_a"],
      vitamin_c: json["vitamin_c"],
      calcium: json["calcium"],
      iron: json["iron"],
    });
  }
}

export default FoodNutritionalContentModel;
