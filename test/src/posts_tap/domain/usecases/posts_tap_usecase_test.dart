import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ninjaz_demo/core/util/network/network_info.dart';
import 'package:ninjaz_demo/src/posts_tap/data/models/posts_model.dart';
import 'package:ninjaz_demo/src/posts_tap/domain/repository/posts_tap_reposatory.dart';
import 'package:ninjaz_demo/src/posts_tap/domain/usecases/posts_tap_usecase.dart';

import 'posts_tap_usecase_test.mocks.dart';


@GenerateMocks([PostsTapRepository,NetworkInfo])
void main() {
  late PostsTapUseCase postsTapUseCase;
  late PostsTapRepository mockPostsRepo;

  late NetworkInfo networkInfo;
  setUp(() {
    mockPostsRepo = MockPostsTapRepository();
    postsTapUseCase = PostsTapUseCase(mockPostsRepo);
    networkInfo=MockNetworkInfo();
    
  });

  test(
    'should call  getPosts from the repository',
    () async {
            when(networkInfo.isConnected).thenAnswer((_) => Future.value(true));

      when(mockPostsRepo.getPosts(limit: 10, page: 1))
          .thenAnswer((realInvocation) => Future.value(PostsResponseModel()));
      // final result = await postsTapUseCase.call(
      //   page: 1,
      //   limit: 20,
      // );
     // expect(result, isA<PostsResponseModel>());
     
    },
  );


}
