class FoodCategoryModel {
  constructor({ id, name, description }) {
    this.id = id;
    this.name = name;
    this.description = description;
  }

  static #fromJson(json) {
    return new FoodCategoryModel({
      id: json?.["food_category_id"],
      name: json?.["food_category_name"],
      description: json?.["food_category_description"],
    });
  }

  static listFromJson(json) {
    const foodCategoriesJson = json["food_categories"]?.["food_category"];
    return foodCategoriesJson.map(foodCategoryJson => {
      return FoodCategoryModel.#fromJson(foodCategoryJson);
    });
  }
}

export default FoodCategoryModel;
