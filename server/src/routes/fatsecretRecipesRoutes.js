import { Router } from "express";
import FatsecretRecipesController from "../controllers/FatsecretRecipesController.js";

const router = Router();

router.get("/search", FatsecretRecipesController.search);

export default router;
