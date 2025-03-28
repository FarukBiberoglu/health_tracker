import FoodModel from "./FoodModel.js";

class FoodSearchModel {
  constructor({ page_number, foods }) {
    this.page_number = page_number;
    this.foods = foods;
  }

  static fromJson(json) {
    const foodsSearchJson = json["foods_search"];
    const foodsJson = foodsSearchJson?.["results"] ?? null;
    const foodJson = foodsJson?.["food"] ?? null;
    return new FoodSearchModel({
      page_number: foodsSearchJson?.["page_number"] ? parseInt(foodsSearchJson["page_number"]) : null,
      foods: foodJson?.map(food => FoodModel.fromJson(food)) ?? null,
    });
  }
}

export default FoodSearchModel;
