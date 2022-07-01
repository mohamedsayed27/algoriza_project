abstract class ShopState {}
class ShopInitial extends ShopState {}
class GetUserLoadingState extends ShopState{}
class GetUserSuccessState extends ShopState{}
class GetUserErrorState extends ShopState{
  final String error;
  GetUserErrorState(this.error);
}
class ChangeBottomNavBarState extends ShopState{}
class AddPostScreenState extends ShopState{}

class GetPickedImageSuccessState extends ShopState{}
class GetPickedImageErrorState extends ShopState{}
class GetPickedCoverSuccessState extends ShopState{}
class GetPickedCoverErrorState extends ShopState{}

class UpdateUserDataLoadingState extends ShopState{}
class UpdateUserDataErrorState extends ShopState{}

class UploadImageSuccessState extends ShopState{}
class UploadImageErrorState extends ShopState{}
class UploadCoverSuccessState extends ShopState{}
class UploadCoverErrorState extends ShopState{}



class CreatePostLoadingState extends ShopState{}
class CreatePostSuccessState extends ShopState{}
class CreatePostErrorState extends ShopState{}

class GetPickedPostImageSuccessState extends ShopState{}
class GetPickedPostImageErrorState extends ShopState{}


class RemovingPostImageState extends ShopState{}



class GetPostsLoadingState extends ShopState{}
class GetPostsSuccessState extends ShopState{}
class GetPostsErrorState extends ShopState{
  final String error;
  GetPostsErrorState(this.error);
}


class PostLikeSuccessState extends ShopState{}
class PostLikeErrorState extends ShopState{
  final String error;
  PostLikeErrorState(this.error);
}