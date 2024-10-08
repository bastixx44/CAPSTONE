import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EquipamientoRecord extends FirestoreRecord {
  EquipamientoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  bool hasCantidad() => _cantidad != null;

  // "fecha_ingreso" field.
  DateTime? _fechaIngreso;
  DateTime? get fechaIngreso => _fechaIngreso;
  bool hasFechaIngreso() => _fechaIngreso != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _cantidad = castToType<int>(snapshotData['cantidad']);
    _fechaIngreso = snapshotData['fecha_ingreso'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('equipamiento');

  static Stream<EquipamientoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EquipamientoRecord.fromSnapshot(s));

  static Future<EquipamientoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EquipamientoRecord.fromSnapshot(s));

  static EquipamientoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EquipamientoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EquipamientoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EquipamientoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EquipamientoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EquipamientoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEquipamientoRecordData({
  String? nombre,
  int? cantidad,
  DateTime? fechaIngreso,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'cantidad': cantidad,
      'fecha_ingreso': fechaIngreso,
    }.withoutNulls,
  );

  return firestoreData;
}

class EquipamientoRecordDocumentEquality
    implements Equality<EquipamientoRecord> {
  const EquipamientoRecordDocumentEquality();

  @override
  bool equals(EquipamientoRecord? e1, EquipamientoRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.cantidad == e2?.cantidad &&
        e1?.fechaIngreso == e2?.fechaIngreso;
  }

  @override
  int hash(EquipamientoRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.cantidad, e?.fechaIngreso]);

  @override
  bool isValidKey(Object? o) => o is EquipamientoRecord;
}
