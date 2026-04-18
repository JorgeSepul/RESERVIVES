/// RESERVIVES - Modelo de Tramo Horario.

library;

class TramoHorario {
  final String id;
  final String nombre;
  final String turno;
  final int numero;
  final String horaInicio;
  final String horaFin;
  final bool esRecreo;
  final bool activo;

  const TramoHorario({
    required this.id,
    required this.nombre,
    required this.turno,
    required this.numero,
    required this.horaInicio,
    required this.horaFin,
    required this.esRecreo,
    required this.activo,
  });

  factory TramoHorario.fromJson(Map<String, dynamic> json) {
    String parseHora(dynamic raw) {
      final s = (raw as String).substring(0, 5);
      return s;
    }

    return TramoHorario(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      turno: json['turno'] as String,
      numero: json['numero'] as int,
      horaInicio: parseHora(json['hora_inicio']),
      horaFin: parseHora(json['hora_fin']),
      esRecreo: json['es_recreo'] as bool? ?? false,
      activo: json['activo'] as bool? ?? true,
    );
  }

  String get rangoHorario => '$horaInicio – $horaFin';

  String get labelCompleto => esRecreo ? 'Recreo ($rangoHorario)' : '$nombre ($rangoHorario)';
}

enum EstadoTramo {
  disponible,
  reservado,
  noPermitido,
  horarioPasado,
}

class TramoDisponibilidad {
  final TramoHorario tramo;
  final bool disponible;
  final bool permitido;
  final bool reservado;
  final String? mensaje;

  const TramoDisponibilidad({
    required this.tramo,
    required this.disponible,
    required this.permitido,
    required this.reservado,
    this.mensaje,
  });

  EstadoTramo get estado {
    if (mensaje == "Horario pasado") return EstadoTramo.horarioPasado;
    if (!permitido) return EstadoTramo.noPermitido;
    if (reservado) return EstadoTramo.reservado;
    return EstadoTramo.disponible;
  }

  factory TramoDisponibilidad.fromJson(Map<String, dynamic> json) {
    return TramoDisponibilidad(
      tramo: TramoHorario.fromJson(json['tramo'] as Map<String, dynamic>),
      disponible: json['disponible'] as bool,
      permitido: json['permitido'] as bool,
      reservado: json['reservado'] as bool,
      mensaje: json['mensaje'] as String?,
    );
  }
}
