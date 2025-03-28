import FatsecretFoodsService from "../services/FatsecretFoodsService.js";

class FatsecretFoodsController {
  async search(req, res) {
    try {
      const { query } = req.query;
      const foods = await FatsecretFoodsService.search(query);
      res.status(foods.status).json(foods);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }

  async getCategories(req, res) {
    try {
      const categories = await FatsecretFoodsService.getCategories();
      res.status(categories.status).json(categories);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }

  async imageRecognition(req, res) {
    try {
      const { image_base64 } = req.body;

      const foods = await FatsecretFoodsService.imageRecognition(image_base64);
      res.status(foods.status).json(foods);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
}

export default new FatsecretFoodsController();
