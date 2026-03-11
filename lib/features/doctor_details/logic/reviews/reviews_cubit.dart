import 'package:doctors_app/features/doctor_details/data/repos/reviews_repo.dart';
import 'package:doctors_app/features/doctor_details/logic/reviews/reviews_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  final ReviewsRepo _reviewsRepo;

  ReviewsCubit(this._reviewsRepo) : super(const ReviewsState.initial());

  void getReviews(String doctorId) async {
    emit(const ReviewsState.loading());
    final response = await _reviewsRepo.getReviews(
      doctorId: doctorId,
    );
    response.when(
      success: (data) {
        final reviews = data.reviewsData?.reviewsList ?? [];
        emit(ReviewsState.success(reviews));
      },
      failure: (error) {
        emit(ReviewsState.error(error: error));
      },
    );
  }
}
