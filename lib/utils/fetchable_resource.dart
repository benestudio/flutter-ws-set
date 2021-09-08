import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetchable_resource.freezed.dart';

@freezed
class FetchableResource<T, E> with _$FetchableResource<T, E> {
  const FetchableResource._();
  const factory FetchableResource.unavailable() = UnavailableResource<T, E>;
  const factory FetchableResource.fetching({@Default(null) T? oldData}) = FetchingResource<T, E>;
  const factory FetchableResource.available(T data) = AvailableResource<T, E>;
  const factory FetchableResource.error([E? error]) = ErrorResource<T, E>;

  T? get dataOrNull => maybeWhen(
        available: (data) => data,
        fetching: (oldData) => oldData,
        orElse: () => null,
      );

  bool get hasError => maybeWhen(
        error: (_) => true,
        orElse: () => false,
      );

  bool get isAvailable => maybeWhen(
        available: (_) => true,
        orElse: () => false,
      );

  bool get isFetching => maybeWhen(
        fetching: (_) => true,
        orElse: () => false,
      );

  FetchableResource<T, E> asFetching() {
    return maybeWhen(
      available: (data) => FetchableResource.fetching(oldData: data),
      fetching: (oldData) => FetchableResource.fetching(oldData: oldData),
      orElse: () => const FetchableResource.fetching(oldData: null),
    );
  }
}
