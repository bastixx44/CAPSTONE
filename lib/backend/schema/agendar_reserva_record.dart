import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgendarReservaRecord extends FirestoreRecord {
  AgendarReservaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fecha_hora_registro" field.
  DateTime? _fechaHoraRegistro;
  DateTime? get fechaHoraRegistro => _fechaHoraRegistro;
  bool hasFechaHoraRegistro() => _fechaHoraRegistro != null;

  // "estado_reserva" field.
  String? _estadoReserva;
  String get estadoReserva => _estadoReserva ?? '';
  bool hasEstadoReserva() => _estadoReserva != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fechaHoraRegistro = snapshotData['fecha_hora_registro'] as DateTime?;
    _estadoReserva = snapshotData['estado_reserva'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('agendar_reserva')
          : FirebaseFirestore.instance.collectionGroup('agendar_reserva');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('agendar_reserva').doc(id);

  static Stream<AgendarReservaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgendarReservaRecord.fromSnapshot(s));

  static Future<AgendarReservaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgendarReservaRecord.fromSnapshot(s));

  static AgendarReservaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AgendarReservaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgendarReservaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgendarReservaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgendarReservaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgendarReservaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgendarReservaRecordData({
  DateTime? fechaHoraRegistro,
  String? estadoReserva,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fecha_hora_registro': fechaHoraRegistro,
      'estado_reserva': estadoReserva,
    }.withoutNulls,
  );

  return firestoreData;
}

class AgendarReservaRecordDocumentEquality
    implements Equality<AgendarReservaRecord> {
  const AgendarReservaRecordDocumentEquality();

  @override
  bool equals(AgendarReservaRecord? e1, AgendarReservaRecord? e2) {
    return e1?.fechaHoraRegistro == e2?.fechaHoraRegistro &&
        e1?.estadoReserva == e2?.estadoReserva;
  }

  @override
  int hash(AgendarReservaRecord? e) =>
      const ListEquality().hash([e?.fechaHoraRegistro, e?.estadoReserva]);

  @override
  bool isValidKey(Object? o) => o is AgendarReservaRecord;
}
