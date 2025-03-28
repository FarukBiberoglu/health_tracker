// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesPageViewModel on _FavoritesPageViewModelBase, Store {
  Computed<FavoriteCategory>? _$typeFilterComputed;

  @override
  FavoriteCategory get typeFilter => (_$typeFilterComputed ??=
          Computed<FavoriteCategory>(() => super.typeFilter,
              name: '_FavoritesPageViewModelBase.typeFilter'))
      .value;

  late final _$_typeFilterAtom =
      Atom(name: '_FavoritesPageViewModelBase._typeFilter', context: context);

  @override
  FavoriteCategory get _typeFilter {
    _$_typeFilterAtom.reportRead();
    return super._typeFilter;
  }

  @override
  set _typeFilter(FavoriteCategory value) {
    _$_typeFilterAtom.reportWrite(value, super._typeFilter, () {
      super._typeFilter = value;
    });
  }

  late final _$_FavoritesPageViewModelBaseActionController =
      ActionController(name: '_FavoritesPageViewModelBase', context: context);

  @override
  void setTypeFilter(FavoriteCategory typeFilter) {
    final _$actionInfo = _$_FavoritesPageViewModelBaseActionController
        .startAction(name: '_FavoritesPageViewModelBase.setTypeFilter');
    try {
      return super.setTypeFilter(typeFilter);
    } finally {
      _$_FavoritesPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
typeFilter: ${typeFilter}
    ''';
  }
}
