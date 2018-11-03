import 'package:angular/angular.dart';

import 'package:ng_blog/src/shared/models/post_model.dart';
import 'package:ng_blog/src/shared/components/post/post_component.dart';

import '../post_service.dart';

@Component(
  selector: 'ng-blog-post-index',
  styleUrls: [
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'post_index_component.css'
  ],
  templateUrl: 'post_index_component.html',
  directives: [
    coreDirectives,
    PostComponent
  ],
  providers: [
    ClassProvider(PostService)
  ]
)
class PostIndexComponent implements OnInit {
  final PostService _postService;
  List<PostModel> posts;

  PostIndexComponent(this._postService);

  @override
  void ngOnInit() {
    _postService.getPosts()
      .listen(
        (posts) => this.posts = posts,
        onError: (error) {
          print('Error ${error}');
        },
        onDone: () {
          print('Done');
        }
    );
  }
}
