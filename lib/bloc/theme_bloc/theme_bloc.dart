import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/theme_bloc/theme_event.dart';
import 'package:pokemon_app/bloc/theme_bloc/theme_state.dart';
import 'package:pokemon_app/global/themes/app_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(appThemeData[AppTheme.lightTheme]!)) {
    on<ThemeChangedEvent>((event, emit) {
      emit(ThemeState(appThemeData[event.theme]!));
    });
  }
}
