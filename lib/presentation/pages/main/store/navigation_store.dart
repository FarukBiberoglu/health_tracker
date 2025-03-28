import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = NavigationStoreStore with _$NavigationStore;

abstract class NavigationStoreStore with Store {
  @observable
  int selectedIndex = 0;

  @action
  void setIndex(int index) {
    selectedIndex = index;
  }
}

final navigationStore = NavigationStore();
