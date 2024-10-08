import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AsistenciaRecord extends FirestoreRecord {
  AsistenciaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "estado_reserva" field.
  bool? _estadoReserva;
  bool get estadoReserva => _estadoReserva ?? false;
  bool hasEstadoReserva() => _estadoReserva != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _estadoReserva = snapshotData['estado_reserva'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('asistencia')
          : FirebaseFirestore.instance.collectionGroup('asistencia');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('asistencia').doc(id);

  static Stream<AsistenciaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AsistenciaRecord.fromSnapshot(s));

  static Future<AsistenciaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AsistenciaRecord.fromSnapshot(s));

  static AsistenciaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AsistenciaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AsistenciaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AsistenciaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AsistenciaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AsistenciaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAsistenciaRecordData({
  bool? estadoReserva,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'estado_reserva': estadoReserva,
    }.withoutNulls,
  );

  return firestoreData;
}

class AsistenciaRecordDocumentEquality implements Equality<AsistenciaRecord> {
  const AsistenciaRecordDocumentEquality();

  @override
  bool equals(AsistenciaRecord? e1, AsistenciaRecord? e2) {
    return e1?.estadoReserva == e2?.estadoReserva;
  }

  @override
  int hash(AsistenciaRecord? e) =>
      const ListEquality().hash([e?.estadoReserva]);

  @override
  bool isValidKey(Object? o) => o is AsistenciaRecord;
}
