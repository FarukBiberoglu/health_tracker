import axios from "axios";
import { getAccessToken } from "../utils/fatsecretAccessToken.js";
import FoodSearchModel from "../models/foods/FoodSearchModel.js";
import FoodCategoryModel from "../models/foods/FoodCategoryModel.js";
import FoodImageRecognitionModel from "../models/foods/FoodImageRecognitionModel.js";

class FatsecretFoodService {
  async search(query) {
    try {
      const fatsecretApiKey = await getAccessToken();
      const response = await axios.get(
        `https://platform.fatsecret.com/rest/foods/search/v3?search_expression=${query}&format=json&region=US&language=en&include_food_attributes=true&include_sub_categories=true&include_food_images=true`,
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${fatsecretApiKey}`,
          },
        }
      );

      if (!response.data || response.data.error) {
        return { message: "No data found", status: 404 };
      }

      return { data: FoodSearchModel.fromJson(response.data), status: 200 };
    } catch (error) {
      return { message: "Something went wrong", status: 500 };
    }
  }

  async getCategories() {
    try {
      const fatsecretApiKey = await getAccessToken();
      const response = await axios.get(
        `https://platform.fatsecret.com/rest/food-categories/v2?format=json&region=US&language=en`,
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${fatsecretApiKey}`,
          },
        }
      );

      if (!response.data || response.data.error) {
        return { message: "No data found", status: 404 };
      }

      return { data: FoodCategoryModel.listFromJson(response.data), status: 200 };
    } catch (error) {
      return { message: "Something went wrong", status: 500 };
    }
  }

  async imageRecognition(image_base64) {
    try {
      const fatsecretApiKey = await getAccessToken("image-recognition");

      const response = await axios.post(
        `https://platform.fatsecret.com/rest/image-recognition/v1`,
        {
          image_b64: image_base64,
          region: "US",
          language: "en",
          include_food_data: true,
        },
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${fatsecretApiKey}`,
          },
        }
      );

      if (!response.data || response.data.error) {
        return { message: "No data found", status: 404 };
      }

      return { data: FoodImageRecognitionModel.fromJson(response.data), status: 200 };
    } catch (error) {
      return { message: "Something went wrong", status: 500 };
    }
  }
}

export default new FatsecretFoodService();
