import 'package:calory_tool/core/configs/constants/app_environments.dart';
import 'package:calory_tool/data/datasources/fatsecret/fatsecret_remote_datasource.dart';
import 'package:calory_tool/data/repositories/fatsecret_api_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

part 'fatsecret_api_injection_mixin.dart';

final class Injection with FatsecretApiInjectionMixin {
  Injection._init();
  static final Injection _instance = Injection._init();
  static Injection get I => _instance;

  final _sl = GetIt.instance;

  void init() {
    fatsecretApiInjection(_sl);
  }

  T read<T extends Object>() => _sl.get<T>();
}
