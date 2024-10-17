import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DisponibilidadRecord extends FirestoreRecord {
  DisponibilidadRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Dia" field.
  DateTime? _dia;
  DateTime? get dia => _dia;
  bool hasDia() => _dia != null;

  // "ListaHoras" field.
  List<DateTime>? _listaHoras;
  List<DateTime> get listaHoras => _listaHoras ?? const [];
  bool hasListaHoras() => _listaHoras != null;

  // "Usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "Cupo_maximo" field.
  int? _cupoMaximo;
  int get cupoMaximo => _cupoMaximo ?? 0;
  bool hasCupoMaximo() => _cupoMaximo != null;

  void _initializeFields() {
    _dia = snapshotData['Dia'] as DateTime?;
    _listaHoras = getDataList(snapshotData['ListaHoras']);
    _usuario = snapshotData['Usuario'] as DocumentReference?;
    _categoria = snapshotData['Categoria'] as String?;
    _cupoMaximo = castToType<int>(snapshotData['Cupo_maximo']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('disponibilidad');

  static Stream<DisponibilidadRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DisponibilidadRecord.fromSnapshot(s));

  static Future<DisponibilidadRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DisponibilidadRecord.fromSnapshot(s));

  static DisponibilidadRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DisponibilidadRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DisponibilidadRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DisponibilidadRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DisponibilidadRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DisponibilidadRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDisponibilidadRecordData({
  DateTime? dia,
  DocumentReference? usuario,
  String? categoria,
  int? cupoMaximo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Dia': dia,
      'Usuario': usuario,
      'Categoria': categoria,
      'Cupo_maximo': cupoMaximo,
    }.withoutNulls,
  );

  return firestoreData;
}

class DisponibilidadRecordDocumentEquality
    implements Equality<DisponibilidadRecord> {
  const DisponibilidadRecordDocumentEquality();

  @override
  bool equals(DisponibilidadRecord? e1, DisponibilidadRecord? e2) {
    const listEquality = ListEquality();
    return e1?.dia == e2?.dia &&
        listEquality.equals(e1?.listaHoras, e2?.listaHoras) &&
        e1?.usuario == e2?.usuario &&
        e1?.categoria == e2?.categoria &&
        e1?.cupoMaximo == e2?.cupoMaximo;
  }

  @override
  int hash(DisponibilidadRecord? e) => const ListEquality()
      .hash([e?.dia, e?.listaHoras, e?.usuario, e?.categoria, e?.cupoMaximo]);

  @override
  bool isValidKey(Object? o) => o is DisponibilidadRecord;
}
