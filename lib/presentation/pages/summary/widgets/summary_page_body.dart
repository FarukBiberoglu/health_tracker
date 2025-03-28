part of '../summary_page_imports.dart';

class _SummaryPageBody extends StatefulWidget {
  const _SummaryPageBody();

  @override
  State<_SummaryPageBody> createState() => _SummaryPageBodyState();
}

class _SummaryPageBodyState extends State<_SummaryPageBody> {
  final _controller = TextEditingController();
  DateTime _currentDate = DateTime.now();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.text = DateFormat('yyyy-MM-dd').format(_currentDate);
  }

  @override
  Widget build(BuildContext context) {
    final foods = context
        .watch<FoodProvider>()
        .sevenDaysFoods
        .ext
        .where
        .firstOrNull(
          (e) => e.date.toUtc().ext.compare.isSameDay(_currentDate.toUtc()),
        );
    return SingleChildScrollView(
      child: Padding(
        padding: AppValues.lg.ext.padding.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppValues.lg.ext.sizedBox.vertical,
            Text(
              'Summary',
              style: context.ext.theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            AppValues.lg.ext.sizedBox.vertical,
            Text(
              'Calories Consumed',
              style: context.ext.theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            AppValues.md.ext.sizedBox.vertical,
            SizedBox(
              width: 200,
              height: 200,
              child: CustomLineChart(
                data:
                    List.generate(7, (index) {
                      final day = DateTime.now().subtract(
                        Duration(days: index),
                      );
                      return CustomLineChartData(
                        xLabel: DateFormat('E').format(day),
                        yLabel: (index + 1).toString(),
                        y:
                            context
                                .watch<FoodProvider>()
                                .sevenDaysFoods
                                .ext
                                .where
                                .firstOrNull(
                                  (e) => e.date.toUtc().ext.compare.isSameDay(
                                    day.toUtc(),
                                  ),
                                )
                                ?.foodEntries
                                .values
                                .fold(
                                  0,
                                  (a, b) =>
                                      (a ?? 0) +
                                      b.fold(
                                        0,
                                        (a, b) =>
                                            a +
                                            (b.servings.first.calories ?? 0),
                                      ),
                                ) ??
                            0,
                      );
                    }).reversed.toList(),
                minY: 0,
                maxY: context
                    .watch<FoodProvider>()
                    .sevenDaysFoods
                    .expand(
                      (e) => e.foodEntries.values.expand(
                        (e) => e.map((e) => e.servings.first.calories ?? 0),
                      ),
                    )
                    .fold(50, (a, b) => a + b),
              ),
            ),
            AppValues.xl2.ext.sizedBox.vertical,
            Text(
              'Daily Planned Meals',
              style: context.ext.theme.textTheme.titleLarge,
            ),
            AppValues.md.ext.sizedBox.vertical,
            CustomTextField(
              controller: _controller,
              readOnly: true,
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _currentDate,
                  firstDate: DateTime.now().subtract(const Duration(days: 6)),
                  lastDate: DateTime.now(),
                );
                if (date == null) return;
                _currentDate = date;
                _controller.text = DateFormat('yyyy-MM-dd').format(date);
                setState(() {});
              },
              suffixIcon: const Icon(Icons.calendar_today),
            ),
            AppValues.md.ext.sizedBox.vertical,
            ...PlannedMealsEnum.values
                .map(
                  (e) => _SummaryPageMealItem(
                    foods: foods?.foodEntries[e] ?? [],
                    plannedMeal: e,
                    date: _currentDate,
                  ),
                )
                .expand(
                  (element) => [element, AppValues.md.ext.sizedBox.vertical],
                ),
          ],
        ),
      ),
    );
  }
}
