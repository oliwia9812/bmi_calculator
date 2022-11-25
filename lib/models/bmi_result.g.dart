// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_result.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetBmiResultCollection on Isar {
  IsarCollection<BmiResult> get bmiResults => this.collection();
}

const BmiResultSchema = CollectionSchema(
  name: r'BmiResult',
  id: 4403625989448812550,
  properties: {
    r'bmiResult': PropertySchema(
      id: 0,
      name: r'bmiResult',
      type: IsarType.double,
    ),
    r'currentUnit': PropertySchema(
      id: 1,
      name: r'currentUnit',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 2,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'height': PropertySchema(
      id: 3,
      name: r'height',
      type: IsarType.double,
    ),
    r'interpretation': PropertySchema(
      id: 4,
      name: r'interpretation',
      type: IsarType.string,
    ),
    r'weight': PropertySchema(
      id: 5,
      name: r'weight',
      type: IsarType.long,
    )
  },
  estimateSize: _bmiResultEstimateSize,
  serialize: _bmiResultSerialize,
  deserialize: _bmiResultDeserialize,
  deserializeProp: _bmiResultDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _bmiResultGetId,
  getLinks: _bmiResultGetLinks,
  attach: _bmiResultAttach,
  version: '3.0.5',
);

int _bmiResultEstimateSize(
  BmiResult object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.currentUnit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.interpretation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _bmiResultSerialize(
  BmiResult object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.bmiResult);
  writer.writeString(offsets[1], object.currentUnit);
  writer.writeDateTime(offsets[2], object.date);
  writer.writeDouble(offsets[3], object.height);
  writer.writeString(offsets[4], object.interpretation);
  writer.writeLong(offsets[5], object.weight);
}

BmiResult _bmiResultDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BmiResult(
    bmiResult: reader.readDoubleOrNull(offsets[0]),
    currentUnit: reader.readStringOrNull(offsets[1]),
    date: reader.readDateTimeOrNull(offsets[2]),
    height: reader.readDoubleOrNull(offsets[3]),
    id: id,
    interpretation: reader.readStringOrNull(offsets[4]),
    weight: reader.readLongOrNull(offsets[5]),
  );
  return object;
}

P _bmiResultDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bmiResultGetId(BmiResult object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bmiResultGetLinks(BmiResult object) {
  return [];
}

void _bmiResultAttach(IsarCollection<dynamic> col, Id id, BmiResult object) {
  object.id = id;
}

extension BmiResultQueryWhereSort
    on QueryBuilder<BmiResult, BmiResult, QWhere> {
  QueryBuilder<BmiResult, BmiResult, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BmiResultQueryWhere
    on QueryBuilder<BmiResult, BmiResult, QWhereClause> {
  QueryBuilder<BmiResult, BmiResult, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BmiResultQueryFilter
    on QueryBuilder<BmiResult, BmiResult, QFilterCondition> {
  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> bmiResultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bmiResult',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      bmiResultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bmiResult',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> bmiResultEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bmiResult',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      bmiResultGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bmiResult',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> bmiResultLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bmiResult',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> bmiResultBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bmiResult',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      currentUnitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentUnit',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      currentUnitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentUnit',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> currentUnitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      currentUnitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> currentUnitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> currentUnitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      currentUnitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currentUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> currentUnitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currentUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> currentUnitContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currentUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> currentUnitMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currentUnit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      currentUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      currentUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currentUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> dateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> dateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> dateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> dateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> heightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> heightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> heightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> heightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> heightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> heightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      interpretationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'interpretation',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      interpretationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'interpretation',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      interpretationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interpretation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      interpretationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'interpretation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      interpretationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'interpretation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      interpretationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'interpretation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      interpretationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'interpretation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      interpretationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'interpretation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      interpretationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'interpretation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      interpretationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'interpretation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      interpretationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'interpretation',
        value: '',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition>
      interpretationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'interpretation',
        value: '',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> weightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> weightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> weightEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weight',
        value: value,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> weightGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weight',
        value: value,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> weightLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weight',
        value: value,
      ));
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterFilterCondition> weightBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BmiResultQueryObject
    on QueryBuilder<BmiResult, BmiResult, QFilterCondition> {}

extension BmiResultQueryLinks
    on QueryBuilder<BmiResult, BmiResult, QFilterCondition> {}

extension BmiResultQuerySortBy on QueryBuilder<BmiResult, BmiResult, QSortBy> {
  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> sortByBmiResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmiResult', Sort.asc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> sortByBmiResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmiResult', Sort.desc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> sortByCurrentUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentUnit', Sort.asc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> sortByCurrentUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentUnit', Sort.desc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> sortByInterpretation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interpretation', Sort.asc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> sortByInterpretationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interpretation', Sort.desc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> sortByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> sortByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension BmiResultQuerySortThenBy
    on QueryBuilder<BmiResult, BmiResult, QSortThenBy> {
  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenByBmiResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmiResult', Sort.asc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenByBmiResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bmiResult', Sort.desc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenByCurrentUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentUnit', Sort.asc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenByCurrentUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentUnit', Sort.desc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenByInterpretation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interpretation', Sort.asc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenByInterpretationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'interpretation', Sort.desc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QAfterSortBy> thenByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension BmiResultQueryWhereDistinct
    on QueryBuilder<BmiResult, BmiResult, QDistinct> {
  QueryBuilder<BmiResult, BmiResult, QDistinct> distinctByBmiResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bmiResult');
    });
  }

  QueryBuilder<BmiResult, BmiResult, QDistinct> distinctByCurrentUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentUnit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<BmiResult, BmiResult, QDistinct> distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<BmiResult, BmiResult, QDistinct> distinctByInterpretation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'interpretation',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BmiResult, BmiResult, QDistinct> distinctByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weight');
    });
  }
}

extension BmiResultQueryProperty
    on QueryBuilder<BmiResult, BmiResult, QQueryProperty> {
  QueryBuilder<BmiResult, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BmiResult, double?, QQueryOperations> bmiResultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bmiResult');
    });
  }

  QueryBuilder<BmiResult, String?, QQueryOperations> currentUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentUnit');
    });
  }

  QueryBuilder<BmiResult, DateTime?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<BmiResult, double?, QQueryOperations> heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<BmiResult, String?, QQueryOperations> interpretationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'interpretation');
    });
  }

  QueryBuilder<BmiResult, int?, QQueryOperations> weightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weight');
    });
  }
}
