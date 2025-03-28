import { Router } from "express";
import FatsecretFoodsController from "../controllers/FatsecretFoodsController.js";

const router = Router();

router.get("/search", FatsecretFoodsController.search);
router.get("/categories", FatsecretFoodsController.getCategories);
router.post("/image_recognition", FatsecretFoodsController.imageRecognition);

export default router;
