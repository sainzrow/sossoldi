import 'package:flutter_test/flutter_test.dart';

import 'package:sossoldi/model/category_transaction.dart';
import 'package:sossoldi/model/base_entity.dart';

void main() {
  test('Test Copy Category Transaction', () {
    CategoryTransaction c = CategoryTransaction(
        id: 2,
        name: "name",
        symbol: 'symbol',
        createdAt: DateTime.utc(2022),
        updatedAt: DateTime.utc(2022));

    CategoryTransaction cCopy = c.copy(id: 10);

    assert(cCopy.id == 10);
    assert(cCopy.name == c.name);
    assert(cCopy.createdAt == c.createdAt);
    assert(cCopy.updatedAt == c.updatedAt);
  });

  test("Test fromJson Category Transaction", () {
    Map<String, Object?> json = {
      BaseEntityFields.id: 0,
      CategoryTransactionFields.name: "name",
      CategoryTransactionFields.symbol: "symbol",
      CategoryTransactionFields.note: "note",
      BaseEntityFields.createdAt: DateTime.utc(2022).toIso8601String(),
      BaseEntityFields.updatedAt: DateTime.utc(2022).toIso8601String(),
    };

    CategoryTransaction c = CategoryTransaction.fromJson(json);

    assert(c.id == json[BaseEntityFields.id]);
    assert(c.name == json[CategoryTransactionFields.name]);
    assert(c.symbol == json[CategoryTransactionFields.symbol]);
    assert(c.note == json[CategoryTransactionFields.note]);
    assert(c.createdAt?.toUtc().toIso8601String() ==
        json[BaseEntityFields.createdAt]);
    assert(c.updatedAt?.toUtc().toIso8601String() ==
        json[BaseEntityFields.updatedAt]);
  });

  test("Test toJson Category Transaction", () {
    CategoryTransaction c = const CategoryTransaction(
        id: 2,
        name: "name",
        symbol: "symbol",
        note: "note");

    Map<String, Object?> json = c.toJson();

    assert(c.id == json[BaseEntityFields.id]);
    assert(c.name == json[CategoryTransactionFields.name]);
    assert(c.symbol == json[CategoryTransactionFields.symbol]);
    assert(c.note == json[CategoryTransactionFields.note]);
  });
}
