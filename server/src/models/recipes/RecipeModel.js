import RecipeNutritionModel from "./RecipeNutritionModel.js";

class RecipeModel {
  constructor({ id, name, description, image, ingredients, types, nutrition }) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.image = image;
    this.ingredients = ingredients;
    this.types = types;
    this.nutrition = nutrition;
  }

  static fromJson(json) {
    return new RecipeModel({
      id: json["recipe_id"],
      name: json["recipe_name"],
      description: json["recipe_description"],
      image: json["recipe_image"],
      ingredients: json["recipe_ingredients"]?.["ingredient"] ?? [],
      types: json["recipe_types"]?.["recipe_type"] ?? [],
      nutrition: json["recipe_nutrition"] ? RecipeNutritionModel.fromJson(json["recipe_nutrition"]) : null,
    });
  }
}

export default RecipeModel;
