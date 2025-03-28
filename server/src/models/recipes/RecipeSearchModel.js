import RecipeModel from "./RecipeModel.js";

class RecipeSearchModel {
  constructor({ page_number = null, recipes = null } = {}) {
    this.page_number = page_number;
    this.recipes = recipes;
  }

  static fromJson(json) {
    const recipesJson = json["recipes"];
    const recipeJson = recipesJson ? recipesJson["recipe"] : null;
    const recipes = recipeJson?.map(e => RecipeModel.fromJson(e)) ?? [];

    return new RecipeSearchModel({
      page_number: recipesJson?.["page_number"] ? parseInt(recipesJson["page_number"]) : null,
      recipes: recipes,
    });
  }
}

export default RecipeSearchModel;
