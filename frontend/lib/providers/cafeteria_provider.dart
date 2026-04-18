/// RESERVIVES - Proveedores de Cafetería.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reservives/models/cafeteria.dart';
import 'package:reservives/services/api_client.dart';

/// Provider que carga el menú completo (categorías con sus productos).
final menuCafeteriaProvider = FutureProvider.autoDispose<List<CategoriaCafeteria>>((ref) async {
  final apiClient = ref.read(apiClientProvider);
  final response = await apiClient.get('/cafeteria/categorias');
  return (response as List).map((e) => CategoriaCafeteria.fromJson(e)).toList();
});

/// Provider que carga los productos destacados.
final productosDestacadosProvider = FutureProvider.autoDispose<List<ProductoCafeteria>>((ref) async {
  final apiClient = ref.read(apiClientProvider);
  final response = await apiClient.get('/cafeteria/productos/destacados');
  return (response as List).map((e) => ProductoCafeteria.fromJson(e)).toList();
});
