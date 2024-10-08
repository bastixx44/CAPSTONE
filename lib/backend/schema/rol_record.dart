import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RolRecord extends FirestoreRecord {
  RolRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre_rol" field.
  String? _nombreRol;
  String get nombreRol => _nombreRol ?? '';
  bool hasNombreRol() => _nombreRol != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombreRol = snapshotData['nombre_rol'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('rol')
          : FirebaseFirestore.instance.collectionGroup('rol');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('rol').doc(id);

  static Stream<RolRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RolRecord.fromSnapshot(s));

  static Future<RolRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RolRecord.fromSnapshot(s));

  static RolRecord fromSnapshot(DocumentSnapshot snapshot) => RolRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RolRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RolRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RolRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RolRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRolRecordData({
  String? nombreRol,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre_rol': nombreRol,
    }.withoutNulls,
  );

  return firestoreData;
}

class RolRecordDocumentEquality implements Equality<RolRecord> {
  const RolRecordDocumentEquality();

  @override
  bool equals(RolRecord? e1, RolRecord? e2) {
    return e1?.nombreRol == e2?.nombreRol;
  }

  @override
  int hash(RolRecord? e) => const ListEquality().hash([e?.nombreRol]);

  @override
  bool isValidKey(Object? o) => o is RolRecord;
}
