import 'package:calory_tool/enum/favorite_category.dart';
import 'package:mobx/mobx.dart';

part 'favorites_page_view_model.g.dart';

class FavoritesPageViewModel = _FavoritesPageViewModelBase
    with _$FavoritesPageViewModel;

abstract class _FavoritesPageViewModelBase with Store {
  @observable
  FavoriteCategory _typeFilter = FavoriteCategory.foods;

  @computed
  FavoriteCategory get typeFilter => _typeFilter;

  @action
  void setTypeFilter(FavoriteCategory typeFilter) {
    _typeFilter = typeFilter;
  }



}
