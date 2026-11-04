import 'package:bta3_physia/features/notifications/data/models/notification_item_model.dart';
import 'package:equatable/equatable.dart';

enum NotificationsViewMode {
  list,
  empty,
  permission,
  failure,
  unavailable,
  loading,
}

enum NotificationFilter { all, unreadOnly }

class ExamsState extends Equatable {
  const ExamsState({
    this.viewMode = NotificationsViewMode.list,
    this.filter = NotificationFilter.all,
    this.items = const [],
    this.grade = 'الصف الثالث الثانوي',
  });

  final NotificationsViewMode viewMode;
  final NotificationFilter filter;
  final List<NotificationItemModel> items;
  final String grade;

  int get unreadCount => items.where((item) => !item.isRead).length;

  List<NotificationItemModel> get filteredItems {
    if (filter == NotificationFilter.unreadOnly) {
      return items.where((item) => !item.isRead).toList();
    }
    return items;
  }

  ExamsState copyWith({
    NotificationsViewMode? viewMode,
    NotificationFilter? filter,
    List<NotificationItemModel>? items,
    String? grade,
  }) {
    return ExamsState(
      viewMode: viewMode ?? this.viewMode,
      filter: filter ?? this.filter,
      items: items ?? this.items,
      grade: grade ?? this.grade,
    );
  }

  @override
  List<Object?> get props => [viewMode, filter, items, grade];
}
