part of '../recipe_details_page_imports.dart';

class _RecipeDetailsPageBody extends StatelessWidget {
  const _RecipeDetailsPageBody({required this.recipeModel});

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(context),
            const SizedBox(height: 15),
            Center(
              child: Text(
                recipeModel.name ?? '',
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildTypeChips(),
            const SizedBox(height: 20),
            _buildTabSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTabSection(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelStyle: TextStyle(fontSize: 18),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            tabs: [Tab(text: 'Ingredients'), Tab(text: 'Nutrition')],
          ),
          SizedBox(
            height: 400,
            child: TabBarView(
              children: [
                _buildIngredientsSection(context),
                _buildNutritionSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: CachedNetworkImage(
            imageUrl: recipeModel.image ?? '',
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
            fit: BoxFit.cover,
            errorWidget:
                (context, error, stackTrace) => const ColoredBox(
                  color: Colors.grey,
                  child: Icon(
                    Icons.broken_image,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
          ),
        ),
        Positioned(
          top: 35,
          left: 16,
          child: GlassEffectButton(
            icon: Icons.arrow_back_outlined,
            onPressed: () => context.router.popForced(),
          ),
        ),
        Positioned(
          top: 35,
          right: 16,
          child: GlassEffectButton(
            icon:
                context.watch<FavoritesProvider>().recipe.any(
                      (e) => e.id == recipeModel.id,
                    )
                    ? Icons.favorite
                    : Icons.favorite_outline,
            onPressed: () {
              context.read<FavoritesProvider>().toogleFavoriteRecipe(
                recipeModel,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTypeChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children:
            recipeModel.types
                .map(
                  (type) => Chip(
                    label: Text(
                      type,
                      style: const TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _buildIngredientsSection(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.only(bottom: 30),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children:
                    recipeModel.ingredients
                        .map(
                          (ingredient) => Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 25,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  size: 20,
                                  color: Colors.green,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    ingredient,
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutritionSection(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  _buildNutritionRow(
                    context,
                    'Calories',
                    '${recipeModel.nutrition?.calories ?? 0} kcal',
                  ),
                  _buildNutritionRow(
                    context,
                    'Protein',
                    '${recipeModel.nutrition?.protein ?? 0} g',
                  ),
                  _buildNutritionRow(
                    context,
                    'Fat',
                    '${recipeModel.nutrition?.fat ?? 0} g',
                  ),
                  _buildNutritionRow(
                    context,
                    'Carbs',
                    '${recipeModel.nutrition?.carbohydrates ?? 0} g',
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutritionRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        children: [
          const Icon(Icons.add_circle, size: 20, color: Colors.green),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$label: $value',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class GlassEffectBox extends StatelessWidget {
  const GlassEffectBox({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.3), // Beyaz cam efekti
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.5), // Beyaz gölge
                blurRadius: 15,
                spreadRadius: 5,
                offset: const Offset(3, 3),
              ),
            ],
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.5),
              width: 1.5,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

class GlassEffectButton extends StatelessWidget {
  const GlassEffectButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 10),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white70),
          child: IconButton(
            icon: Icon(icon, color: Colors.black),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
