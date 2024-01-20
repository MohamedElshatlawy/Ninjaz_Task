import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ninjaz_demo/core/util/network/network_info.dart';
import 'package:ninjaz_demo/src/posts_tap/data/datasources/posts_tap_remote_data_source.dart';
import 'package:ninjaz_demo/src/posts_tap/data/repository/posts_tap_reposatory_imp.dart';

import 'posts_tap_reposatory_test.mocks.dart';

@GenerateMocks([NetworkInfo, PostsTapRemoteDataSource])
void main() {
  late PostsTapRemoteDataSource postsTapRemoteDataSource;
  late NetworkInfo mockNetworkInfo;
  late PostsTapRepositoryImp postsTapRepositoryImp;

  setUp(() {
    postsTapRemoteDataSource = MockPostsTapRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    postsTapRepositoryImp = PostsTapRepositoryImp(
      dataSource: postsTapRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group(
      "Test Posts Repository internet connection and get all posts",
      () {
    test('Return internet connection  connected (true)', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(true));
      final result = await mockNetworkInfo.isConnected;
      expect(result, true);
    });
    test('Get Posts from repository', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(true));
      when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(false));
      when(postsTapRemoteDataSource.getPosts(
      page: 1,
        limit: 20,
      ));
      try {
        await postsTapRepositoryImp.getPosts(
        
        page: 1,
          limit: 20,
        );
        verify(await postsTapRepositoryImp.getPosts(
          page: 1,
          limit: 20,
        ));
      } catch (e) {
        throwsA(UnimplementedError("No Internet Connection"));
      }
    });
  });
}
