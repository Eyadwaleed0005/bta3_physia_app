import 'package:equatable/equatable.dart';

enum NotificationType { live, lesson, course, exam }

class NotificationItemModel extends Equatable {
  const NotificationItemModel({
    required this.id,
    required this.title,
    required this.body,
    required this.time,
    required this.type,
    this.isRead = false,
  });

  final String id;
  final String title;
  final String body;
  final String time;
  final NotificationType type;
  final bool isRead;

  NotificationItemModel copyWith({
    String? id,
    String? title,
    String? body,
    String? time,
    NotificationType? type,
    bool? isRead,
  }) {
    return NotificationItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      time: time ?? this.time,
      type: type ?? this.type,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  List<Object?> get props => [id, title, body, time, type, isRead];

  static List<NotificationItemModel> defaultItems() {
    return const [
      NotificationItemModel(
        id: '1',
        title: 'بدأ البث المباشر',
        body: 'مراجعة قوانين الحركة متاحة الآن لصفّك.',
        time: 'منذ 5 دقائق',
        type: NotificationType.live,
        isRead: false,
      ),
      NotificationItemModel(
        id: '2',
        title: 'درس جديد في أساسيات الفيزياء',
        body: 'الدرس 1: الكميات الفيزيائية.',
        time: 'منذ ساعة',
        type: NotificationType.lesson,
        isRead: false,
      ),
      NotificationItemModel(
        id: '3',
        title: 'كورس الحركة في خط مستقيم',
        body: 'اطّلع على الكورس وفق حالة اشتراكك الحالية.',
        time: 'منذ ساعتين',
        type: NotificationType.course,
        isRead: true,
      ),
      NotificationItemModel(
        id: '4',
        title: 'نُشر امتحان جديد',
        body: 'مراجعة الحركة في خط مستقيم.',
        time: 'أمس، 8:00 م',
        type: NotificationType.exam,
        isRead: true,
      ),
    ];
  }
}
