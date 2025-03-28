import axios from "axios";
import RecipeSearchModel from "../models/recipes/RecipeSearchModel.js";
import { getAccessToken } from "../utils/fatsecretAccessToken.js";

class FatsecretRecipeService {
  async search(query) {
    try {
      const fatsecretApiKey = await getAccessToken();
      const response = await axios.get(
        `https://platform.fatsecret.com/rest/recipes/search/v3?search_expression=${query}&format=json&region=US&language=en`,
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

      return { data: RecipeSearchModel.fromJson(response.data), status: 200 };
    } catch (error) {
      return { message: "Something went wrong", status: 500 };
    }
  }
}

export default new FatsecretRecipeService();
