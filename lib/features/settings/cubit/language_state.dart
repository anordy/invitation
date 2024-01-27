part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class ChangeLanguageState extends LanguageState {
  final Locale locale;
  ChangeLanguageState({required this.locale});
}
