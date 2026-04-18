/// RESERVIVES - Modelo de Cafetería.


library;

import 'package:reservives/config/constants.dart';

class CategoriaCafeteria {
  final String id;
  final String nombre;
  final String? descripcion;
  final String? imagenUrl;
  final int orden;
  final bool activa;
  final List<ProductoCafeteria> productos;

  const CategoriaCafeteria({
    required this.id,
    required this.nombre,
    this.descripcion,
    this.imagenUrl,
    required this.orden,
    required this.activa,
    required this.productos,
  });

  factory CategoriaCafeteria.fromJson(Map<String, dynamic> json) {
    final productosList = json['productos'] as List? ?? [];
    return CategoriaCafeteria(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      descripcion: json['descripcion'] as String?,
      imagenUrl: AppConstants.resolveApiUrl(json['imagen_url'] as String?),
      orden: json['orden'] as int,
      activa: json['activa'] as bool,
      productos: productosList
          .map((p) => ProductoCafeteria.fromJson(p as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ProductoCafeteria {
  final String id;
  final String categoriaId;
  final String nombre;
  final String? descripcion;
  final String? imagenUrl;
  final double precio;
  final bool disponible;
  final bool destacado;

  const ProductoCafeteria({
    required this.id,
    required this.categoriaId,
    required this.nombre,
    this.descripcion,
    this.imagenUrl,
    required this.precio,
    required this.disponible,
    required this.destacado,
  });

  factory ProductoCafeteria.fromJson(Map<String, dynamic> json) {
    final precioRaw = json['precio'];
    final precio = precioRaw is num
        ? precioRaw.toDouble()
        : double.tryParse(precioRaw.toString()) ?? 0.0;

    return ProductoCafeteria(
      id: json['id'] as String,
      categoriaId: json['categoria_id'] as String,
      nombre: json['nombre'] as String,
      descripcion: json['descripcion'] as String?,
      imagenUrl: AppConstants.resolveApiUrl(json['imagen_url'] as String?),
      precio: precio,
      disponible: json['disponible'] as bool,
      destacado: json['destacado'] as bool,
    );
  }
}
