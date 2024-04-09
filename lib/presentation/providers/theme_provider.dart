import 'package:flutter_8/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// booleano que nos dice si esta encendido el modo oscuro
// el stateProvider es para estados de objetos (que si cambian)
final darkModeProvider = StateProvider<bool>((ref) => false);



// este provider nos brinda una lista de colores que son los del tema
 // el provider es para valores inmutables
final colorListProvider = Provider((ref) => colorList);


// el color que se selecciono de la previa lista
final selectedColorProvider = StateProvider((ref) => 0);



// objeto de tipo AppTheme custom
// para cuando el estado es un objeto un poco mas elaborado, y tambien es de estado
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme> (
  (ref) => ThemeNotifier());



class ThemeNotifier extends StateNotifier<AppTheme> {
  // Estado = new AppTheme()
  ThemeNotifier():super( AppTheme()); 
  // creame una instancia del apptheme con sus valores por defecto
void toggleDarkMode(){
  state = state.copyWith(isDarkMode: !state.isDarkMode);
}


void changeColorIndex(int colorIndex){
  state = state.copyWith(selectedColor: colorIndex);
}


}

