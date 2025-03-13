import 'package:test/test.dart';

void main() {
  test('이름 목록 테스트', () {
    List<String> names = ['형님', '아우', '친구'];

    expect(names, contains('형님'));
    expect(names.length, equals(3));
    expect(names[0], equals('형님'));
  });
}
