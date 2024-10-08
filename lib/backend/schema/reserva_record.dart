import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservaRecord extends FirestoreRecord {
  ReservaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fecha_reserva" field.
  DateTime? _fechaReserva;
  DateTime? get fechaReserva => _fechaReserva;
  bool hasFechaReserva() => _fechaReserva != null;

  // "duracion_reserva" field.
  int? _duracionReserva;
  int get duracionReserva => _duracionReserva ?? 0;
  bool hasDuracionReserva() => _duracionReserva != null;

  // "cupo_max" field.
  int? _cupoMax;
  int get cupoMax => _cupoMax ?? 0;
  bool hasCupoMax() => _cupoMax != null;

  // "cupo_actual" field.
  int? _cupoActual;
  int get cupoActual => _cupoActual ?? 0;
  bool hasCupoActual() => _cupoActual != null;

  // "estado_reserva" field.
  String? _estadoReserva;
  String get estadoReserva => _estadoReserva ?? '';
  bool hasEstadoReserva() => _estadoReserva != null;

  void _initializeFields() {
    _fechaReserva = snapshotData['fecha_reserva'] as DateTime?;
    _duracionReserva = castToType<int>(snapshotData['duracion_reserva']);
    _cupoMax = castToType<int>(snapshotData['cupo_max']);
    _cupoActual = castToType<int>(snapshotData['cupo_actual']);
    _estadoReserva = snapshotData['estado_reserva'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reserva');

  static Stream<ReservaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReservaRecord.fromSnapshot(s));

  static Future<ReservaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReservaRecord.fromSnapshot(s));

  static ReservaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReservaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReservaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReservaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReservaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReservaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReservaRecordData({
  DateTime? fechaReserva,
  int? duracionReserva,
  int? cupoMax,
  int? cupoActual,
  String? estadoReserva,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fecha_reserva': fechaReserva,
      'duracion_reserva': duracionReserva,
      'cupo_max': cupoMax,
      'cupo_actual': cupoActual,
      'estado_reserva': estadoReserva,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservaRecordDocumentEquality implements Equality<ReservaRecord> {
  const ReservaRecordDocumentEquality();

  @override
  bool equals(ReservaRecord? e1, ReservaRecord? e2) {
    return e1?.fechaReserva == e2?.fechaReserva &&
        e1?.duracionReserva == e2?.duracionReserva &&
        e1?.cupoMax == e2?.cupoMax &&
        e1?.cupoActual == e2?.cupoActual &&
        e1?.estadoReserva == e2?.estadoReserva;
  }

  @override
  int hash(ReservaRecord? e) => const ListEquality().hash([
        e?.fechaReserva,
        e?.duracionReserva,
        e?.cupoMax,
        e?.cupoActual,
        e?.estadoReserva
      ]);

  @override
  bool isValidKey(Object? o) => o is ReservaRecord;
}
