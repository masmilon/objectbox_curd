// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'objectBox/entities.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(4, 7894308438105442196),
      name: 'PersonModel',
      lastPropertyId: const IdUid(4, 4588642953391754921),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 157562545533044174),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8548476415689228752),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4350851106061496539),
            name: 'address',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4588642953391754921),
            name: 'mobile',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(4, 7894308438105442196),
      lastIndexId: const IdUid(1, 5384160166717723332),
      lastRelationId: const IdUid(1, 7511093415651191463),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [
        5180992329980313560,
        4755890367830028172,
        569192521732867073
      ],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        3491609501790996691,
        2945389429325152582,
        9101037699076131136,
        8969031092177634754,
        9175421398899983355,
        3958107576107912706,
        3894841314003123980,
        8190676006277636481,
        578174900304549453,
        9030935403327669832,
        6194766061187847542
      ],
      retiredRelationUids: const [7511093415651191463],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    PersonModel: EntityDefinition<PersonModel>(
        model: _entities[0],
        toOneRelations: (PersonModel object) => [],
        toManyRelations: (PersonModel object) => {},
        getId: (PersonModel object) => object.id,
        setId: (PersonModel object, int id) {
          object.id = id;
        },
        objectToFB: (PersonModel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final addressOffset = fbb.writeString(object.address);
          final mobileOffset = fbb.writeString(object.mobile);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, addressOffset);
          fbb.addOffset(3, mobileOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = PersonModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              address:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
              mobile: const fb.StringReader()
                  .vTableGet(buffer, rootOffset, 10, ''));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [PersonModel] entity fields to define ObjectBox queries.
class PersonModel_ {
  /// see [PersonModel.id]
  static final id =
      QueryIntegerProperty<PersonModel>(_entities[0].properties[0]);

  /// see [PersonModel.name]
  static final name =
      QueryStringProperty<PersonModel>(_entities[0].properties[1]);

  /// see [PersonModel.address]
  static final address =
      QueryStringProperty<PersonModel>(_entities[0].properties[2]);

  /// see [PersonModel.mobile]
  static final mobile =
      QueryStringProperty<PersonModel>(_entities[0].properties[3]);
}
