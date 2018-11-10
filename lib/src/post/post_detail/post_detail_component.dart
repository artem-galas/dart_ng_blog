import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:angular_components/angular_components.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_input/material_input_multiline.dart';

import 'package:ng_blog/src/routes.dart';
import 'package:ng_blog/src/shared/models/post_model.dart';

import '../post_service.dart';

@Component(
  selector: 'ng-blog-post-detail-component',
  styleUrls: [
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'post_detail_component.css',
  ],
  templateUrl: 'post_detail_component.html',
  directives: [
    coreDirectives,
    formDirectives,
    materialInputDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialInputComponent,
    MaterialMultilineInputComponent
  ],
  providers: [
    ClassProvider(PostService)
  ]
)
class PostDetailComponent implements OnInit, OnActivate {
  PostModel post;
  ControlGroup postForm;
  int postId;
  final PostService _postService;
  final Router _router;

  PostDetailComponent(this._postService, this._router);

  @override
  void ngOnInit() {
    _buildForm();
  }

  void savePost() {
    if (postForm.valid) {
      if (postId != null) {
        _postService.updatePost(PostModel.fromJson(postForm.value), post.id)
          .listen((post) => _router.navigate(RoutePaths.posts_index.toUrl()));
      } else {
        _postService.createPost(PostModel.fromJson(postForm.value))
          .listen((post) => _router.navigate(RoutePaths.posts_index.toUrl()));
      }
    }
  }

  void _buildForm() {
    postForm = FormBuilder.controlGroup({
      'title': ['', Validators.required],
      'body': ['', Validators.required],
    });
  }

  @override
  void onActivate(_, RouterState current) {
    postId = getId(current.parameters);

    if (postId != null) {
      _postService
        .getPost(postId)
        .listen((post) {
          this.post = post;
          postForm.updateValue({'title': post.title, 'body': post.body});
      });
    } else {
      post = PostModel();
      postForm.updateValue({'title': post.title, 'body': post.body});
    }
  }

}
