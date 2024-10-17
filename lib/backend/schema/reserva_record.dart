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

  // "hora_reserva" field.
  DateTime? _horaReserva;
  DateTime? get horaReserva => _horaReserva;
  bool hasHoraReserva() => _horaReserva != null;

  // "cupo_maximo" field.
  int? _cupoMaximo;
  int get cupoMaximo => _cupoMaximo ?? 0;
  bool hasCupoMaximo() => _cupoMaximo != null;

  // "usuariosInscritos" field.
  List<int>? _usuariosInscritos;
  List<int> get usuariosInscritos => _usuariosInscritos ?? const [];
  bool hasUsuariosInscritos() => _usuariosInscritos != null;

  void _initializeFields() {
    _fechaReserva = snapshotData['fecha_reserva'] as DateTime?;
    _horaReserva = snapshotData['hora_reserva'] as DateTime?;
    _cupoMaximo = castToType<int>(snapshotData['cupo_maximo']);
    _usuariosInscritos = getDataList(snapshotData['usuariosInscritos']);
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
  DateTime? horaReserva,
  int? cupoMaximo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fecha_reserva': fechaReserva,
      'hora_reserva': horaReserva,
      'cupo_maximo': cupoMaximo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReservaRecordDocumentEquality implements Equality<ReservaRecord> {
  const ReservaRecordDocumentEquality();

  @override
  bool equals(ReservaRecord? e1, ReservaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fechaReserva == e2?.fechaReserva &&
        e1?.horaReserva == e2?.horaReserva &&
        e1?.cupoMaximo == e2?.cupoMaximo &&
        listEquality.equals(e1?.usuariosInscritos, e2?.usuariosInscritos);
  }

  @override
  int hash(ReservaRecord? e) => const ListEquality().hash(
      [e?.fechaReserva, e?.horaReserva, e?.cupoMaximo, e?.usuariosInscritos]);

  @override
  bool isValidKey(Object? o) => o is ReservaRecord;
}
