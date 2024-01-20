import 'package:flutter_test/flutter_test.dart';
import 'package:ninjaz_demo/src/posts_tap/domain/entities/posts_entity.dart';

void main() {
  var postEntity =
      PostsResponseEntity(limit: 10, page: 1, postData: [], total: 200);

  test("Test Posts Entity", () {
    expect(postEntity, isA<PostsResponseEntity>());
  });

  test(
    "Test copywith Posts Entity",
    () {
      var copyPostsEntity =
          postEntity.copyWith(limit: 10, page: 1, postData: [], total: 200);

      expect(copyPostsEntity, isA<PostsResponseEntity>());
    },
  );
}
