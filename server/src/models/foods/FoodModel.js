import FoodAllergenModel from "./FoodAllergenModel.js";
import FoodPreferenceModel from "./FoodPreferenceModel.js";
import FoodServingModel from "./FoodServingModel.js";

class FoodModel {
  constructor({ id, name, brand_name, type, sub_categories, url, allergens, preferences, servings, image_url }) {
    this.id = id;
    this.name = name;
    this.brand_name = brand_name;
    this.type = type;
    this.sub_categories = sub_categories;
    this.url = url;
    this.allergens = allergens;
    this.preferences = preferences;
    this.servings = servings;
    this.image_url = image_url;
  }

  static fromJson(json) {
    const foodAttributes = json["food_attributes"];
    return new FoodModel({
      id: json["food_id"],
      name: json["food_name"],
      brand_name: json["brand_name"],
      type: json["food_type"],
      sub_categories: json["food_sub_categories"]?.["food_sub_category"] ?? [],
      url: json["food_url"],
      allergens:
        foodAttributes?.["allergens"]?.["allergen"]?.map(allergen => FoodAllergenModel.fromJson(allergen)) ?? [],
      preferences:
        foodAttributes?.["preferences"]?.["preference"]?.map(preference => FoodPreferenceModel.fromJson(preference)) ??
        [],
      servings: json["servings"]?.["serving"]?.map(serving => FoodServingModel.fromJson(serving)) ?? [],
      image_url: json["food_images"]?.["food_image"]?.[0]?.["image_url"],
    });
  }
}

export default FoodModel;
