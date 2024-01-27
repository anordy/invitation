import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:invitation/features/settings/helpers/cache_helper.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  void getSavedLanguage() {
    final cachedLanguageCode = CacheHelper.getCachedLanguage();
    emit(ChangeLanguageState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await CacheHelper.cacheLanguage(languageCode);
    emit(ChangeLanguageState(locale: Locale(languageCode)));
  }
}
