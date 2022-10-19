import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_app/global/themes/app_theme.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChangedEvent extends ThemeEvent {
  final AppTheme theme;
  const ThemeChangedEvent(this.theme);

  @override
  List<Object?> get props => [];
}

class ThemeToggleEvent extends ThemeEvent {
  const ThemeToggleEvent();

  @override
  List<Object?> get props => [];
}
