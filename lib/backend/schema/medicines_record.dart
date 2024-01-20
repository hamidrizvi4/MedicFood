import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicinesRecord extends FirestoreRecord {
  MedicinesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "drugName" field.
  String? _drugName;
  String get drugName => _drugName ?? '';
  bool hasDrugName() => _drugName != null;

  // "foodToAvoid" field.
  String? _foodToAvoid;
  String get foodToAvoid => _foodToAvoid ?? '';
  bool hasFoodToAvoid() => _foodToAvoid != null;

  // "foodToTake" field.
  String? _foodToTake;
  String get foodToTake => _foodToTake ?? '';
  bool hasFoodToTake() => _foodToTake != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "interactingWith" field.
  String? _interactingWith;
  String get interactingWith => _interactingWith ?? '';
  bool hasInteractingWith() => _interactingWith != null;

  // "searchKey" field.
  String? _searchKey;
  String get searchKey => _searchKey ?? '';
  bool hasSearchKey() => _searchKey != null;

  // "timeToTake" field.
  String? _timeToTake;
  String get timeToTake => _timeToTake ?? '';
  bool hasTimeToTake() => _timeToTake != null;

  // "url2" field.
  String? _url2;
  String get url2 => _url2 ?? '';
  bool hasUrl2() => _url2 != null;

  // "url3" field.
  String? _url3;
  String get url3 => _url3 ?? '';
  bool hasUrl3() => _url3 != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "url1" field.
  String? _url1;
  String get url1 => _url1 ?? '';
  bool hasUrl1() => _url1 != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _drugName = snapshotData['drugName'] as String?;
    _foodToAvoid = snapshotData['foodToAvoid'] as String?;
    _foodToTake = snapshotData['foodToTake'] as String?;
    _id = snapshotData['id'] as String?;
    _interactingWith = snapshotData['interactingWith'] as String?;
    _searchKey = snapshotData['searchKey'] as String?;
    _timeToTake = snapshotData['timeToTake'] as String?;
    _url2 = snapshotData['url2'] as String?;
    _url3 = snapshotData['url3'] as String?;
    _url = snapshotData['url'] as String?;
    _url1 = snapshotData['url1'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medicines');

  static Stream<MedicinesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicinesRecord.fromSnapshot(s));

  static Future<MedicinesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicinesRecord.fromSnapshot(s));

  static MedicinesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicinesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicinesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicinesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicinesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicinesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicinesRecordData({
  String? description,
  String? drugName,
  String? foodToAvoid,
  String? foodToTake,
  String? id,
  String? interactingWith,
  String? searchKey,
  String? timeToTake,
  String? url2,
  String? url3,
  String? url,
  String? url1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'drugName': drugName,
      'foodToAvoid': foodToAvoid,
      'foodToTake': foodToTake,
      'id': id,
      'interactingWith': interactingWith,
      'searchKey': searchKey,
      'timeToTake': timeToTake,
      'url2': url2,
      'url3': url3,
      'url': url,
      'url1': url1,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicinesRecordDocumentEquality implements Equality<MedicinesRecord> {
  const MedicinesRecordDocumentEquality();

  @override
  bool equals(MedicinesRecord? e1, MedicinesRecord? e2) {
    return e1?.description == e2?.description &&
        e1?.drugName == e2?.drugName &&
        e1?.foodToAvoid == e2?.foodToAvoid &&
        e1?.foodToTake == e2?.foodToTake &&
        e1?.id == e2?.id &&
        e1?.interactingWith == e2?.interactingWith &&
        e1?.searchKey == e2?.searchKey &&
        e1?.timeToTake == e2?.timeToTake &&
        e1?.url2 == e2?.url2 &&
        e1?.url3 == e2?.url3 &&
        e1?.url == e2?.url &&
        e1?.url1 == e2?.url1;
  }

  @override
  int hash(MedicinesRecord? e) => const ListEquality().hash([
        e?.description,
        e?.drugName,
        e?.foodToAvoid,
        e?.foodToTake,
        e?.id,
        e?.interactingWith,
        e?.searchKey,
        e?.timeToTake,
        e?.url2,
        e?.url3,
        e?.url,
        e?.url1
      ]);

  @override
  bool isValidKey(Object? o) => o is MedicinesRecord;
}
