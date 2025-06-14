import 'package:bloc/bloc.dart';
import 'package:democracy/app/social/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail_state.dart';
part 'post_detail_cubit.freezed.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  PostDetailCubit() : super(const PostDetailState.initial());
}
