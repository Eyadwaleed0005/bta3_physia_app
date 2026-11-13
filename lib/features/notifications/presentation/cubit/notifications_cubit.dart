import 'package:bta3_physia/features/notifications/data/models/notification_item_model.dart';
import 'package:bta3_physia/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit({List<NotificationItemModel>? initialItems})
    : super(
        NotificationsState(
          items: initialItems ?? NotificationItemModel.defaultItems(),
        ),
      );

  void setFilter(NotificationFilter filter) {
    emit(state.copyWith(filter: filter));
  }

  void setViewMode(NotificationsViewMode mode) {
    emit(state.copyWith(viewMode: mode));
  }

  void markAllAsRead() {
    final updated = state.items
        .map((item) => item.copyWith(isRead: true))
        .toList();
    emit(state.copyWith(items: updated));
  }

  void markItemAsRead(String id) {
    final updated = state.items.map((item) {
      if (item.id == id) {
        return item.copyWith(isRead: true);
      }
      return item;
    }).toList();
    emit(state.copyWith(items: updated));
  }

  void refresh() {
    emit(state.copyWith(viewMode: NotificationsViewMode.loading));
    Future.delayed(const Duration(milliseconds: 600), () {
      if (!isClosed) {
        emit(
          state.copyWith(
            viewMode: NotificationsViewMode.list,
            items: NotificationItemModel.defaultItems(),
          ),
        );
      }
    });
  }
}
