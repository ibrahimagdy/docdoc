import 'dart:async';
import 'package:doctors_app/features/home/data/models/recommendation_doctors_response.dart';
import 'package:doctors_app/features/home/data/repos/recommendation_doctors_repo.dart';
import 'package:doctors_app/features/home/logic/recommendation_doctors/recommendation_doctors_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationDoctorsCubit extends Cubit<RecommendationDoctorsState> {
  final RecommendationDoctorsRepo _recommendationDoctorsRepo;

  static const int _pageSize = 10;
  int _currentPage = 1;
  String? _searchQuery;
  bool _isSearchingByName = true;
  List<DoctorData> _allDoctors = [];
  Timer? _debounceTimer;
  bool _isLoadingMore = false;

  RecommendationDoctorsCubit(this._recommendationDoctorsRepo)
      : super(const RecommendationDoctorsState.initial());

  void getRecommendationDoctors() async {
    emit(const RecommendationDoctorsState.loading());
    final response = await _recommendationDoctorsRepo.getRecommendationDoctors(
      pageSize: _pageSize,
      pageIndex: 1,
    );
    response.when(
      success: (data) {
        emit(RecommendationDoctorsState.success(data));
      },
      failure: (error) {
        emit(RecommendationDoctorsState.error(error: error));
      },
    );
  }

  void getAllDoctors() async {
    _currentPage = 1;
    _allDoctors = [];
    _searchQuery = null;
    _isSearchingByName = true;
    _isLoadingMore = false;
    emit(const RecommendationDoctorsState.loading());
    await _fetchPage();
  }

  void loadMore() async {
    final currentState = state;
    if (_isLoadingMore) return;
    if (currentState is! Success || !currentState.hasMore) return;

    _isLoadingMore = true;
    _currentPage++;

    emit(RecommendationDoctorsState.loadingMore(
      currentDoctors: _allDoctors,
      currentPage: _currentPage,
    ));

    await _fetchPage();
    _isLoadingMore = false;
  }

  void search(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      _currentPage = 1;
      _allDoctors = [];
      _isLoadingMore = false;
      _searchQuery = query.isEmpty ? null : query;
      _isSearchingByName = true;

      emit(const RecommendationDoctorsState.loading());
      await _fetchPage();
    });
  }

  Future<void> _fetchPage() async {
    final String? nameParam = _isSearchingByName ? _searchQuery : null;
    final String? specializationParam =
        _isSearchingByName ? null : _searchQuery;

    final response = await _recommendationDoctorsRepo.getRecommendationDoctors(
      pageSize: _pageSize,
      pageIndex: _currentPage,
      name: nameParam,
      specialization: specializationParam,
    );

    response.when(
      success: (data) async {
        final newDoctors = data.doctorsData?.doctorsList ?? [];

        if (newDoctors.isEmpty &&
            _searchQuery != null &&
            _isSearchingByName &&
            _currentPage == 1) {
          _isSearchingByName = false; // change search type to specialization
          await _fetchPage();
          return;
        }

        _allDoctors = [..._allDoctors, ...newDoctors];
        final totalCount = data.doctorsData?.count ?? 0;
        final hasMore = _allDoctors.length < totalCount;

        emit(RecommendationDoctorsState.success(
          data,
          allDoctors: _allDoctors,
          hasMore: hasMore,
          currentPage: _currentPage,
        ));
      },
      failure: (error) {
        emit(RecommendationDoctorsState.error(error: error));
      },
    );
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
