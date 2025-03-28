import FoodModel from "./FoodModel.js";
import FoodEatenModel from "./FoodEatenModel.js";
import FoodSuggestedServingModel from "./FoodSuggestedServingModel.js";

class FoodImageRecognitionModel {
  constructor({ food_id, food_name, eaten, suggested_serving, food }) {
    this.food_id = food_id;
    this.food_name = food_name;
    this.eaten = eaten;
    this.suggested_serving = suggested_serving;
    this.food = food;
  }

  static fromJson(json) {
    return new FoodImageRecognitionModel({
      food_id: json["food_id"],
      food_name: json["food_entry_name"],
      eaten: json["eaten"] ? FoodEatenModel.fromJson(json["eaten"]) : null,
      suggested_serving: json["suggested_serving"]
        ? FoodSuggestedServingModel.fromJson(json["suggested_serving"])
        : null,
      food: json["food"] ? FoodModel.fromJson(json["food"]) : null,
    });
  }
}

export default FoodImageRecognitionModel;
