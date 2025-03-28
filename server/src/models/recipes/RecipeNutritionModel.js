class RecipeNutritionModel {
  constructor({ calories, carbohydrates, fat, protein }) {
    this.calories = calories;
    this.carbohydrates = carbohydrates;
    this.fat = fat;
    this.protein = protein;
  }

  static fromJson(json) {
    return new RecipeNutritionModel({
      calories: json["calories"] ? parseInt(json["calories"]) : null,
      carbohydrates: json["carbohydrate"] ? parseFloat(json["carbohydrate"]) : null,
      fat: json["fat"] ? parseFloat(json["fat"]) : null,
      protein: json["protein"] ? parseFloat(json["protein"]) : null,
    });
  }
}

export default RecipeNutritionModel;
