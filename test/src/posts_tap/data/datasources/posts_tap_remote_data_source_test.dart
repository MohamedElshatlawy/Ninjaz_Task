import 'package:dio/dio.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ninjaz_demo/core/util/network_service.dart';
import 'package:ninjaz_demo/src/posts_tap/data/datasources/posts_tap_remote_data_source.dart';
import 'package:ninjaz_demo/src/posts_tap/data/models/posts_model.dart';

import 'posts_tap_remote_data_source_test.mocks.dart';


@GenerateMocks([NetworkService])
void main() {
  late PostsTapRemoteDataSourceImpl remoteDataSource;
  late NetworkService mockNetworkService;

  setUp(() {
    mockNetworkService = MockNetworkService();
    remoteDataSource = PostsTapRemoteDataSourceImpl(mockNetworkService);
  });

  test('posts data source', () async {

    const url = "post";
  Map<String, dynamic> queryParams = {
      "page": 1,
      "limit": 20,
    };
    Map<String, dynamic> expectedResult = {
      "data":[],
      "total":20,
      "page":1,
      "limit":10
   
    };

    when(mockNetworkService.get(url,
            queryParams: queryParams, headers: anyNamed('headers')))
        .thenAnswer(
      (_) async => Response(
          requestOptions: RequestOptions(
            path: url,
          ),
          data: expectedResult),
    );

    expect(
        await remoteDataSource.getPosts(
          page: 1,limit: 20),
        isA<PostsResponseModel>());
  });
}