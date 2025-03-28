import FatsecretRecipesService from "../services/FatsecretRecipesService.js";

class FatsecretRecipesController {
  async search(req, res) {
    try {
      const { query } = req.query;
      const recipes = await FatsecretRecipesService.search(query);
      res.status(recipes.status).json(recipes);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  }
}

export default new FatsecretRecipesController();
