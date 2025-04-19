import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vas_app/core/resources/assets/resources.dart';
import 'package:vas_app/core/theme/app_colors.dart';
import 'package:vas_app/core/theme/typography.dart';
import 'package:vas_app/core/widgets/gradient_banner_widget.dart';
import 'package:vas_app/core/widgets/other_option_widget.dart';
import 'package:vas_app/core/widgets/custom_notification_widget.dart';
import 'package:vas_app/feature/app/routing/route_path.dart';
import '../../../auth_page/presentation/bloc/auth_bloc.dart';
import '../../../history_page/presentation/bloc/history_order_bloc.dart';
import '../../../order_page/presentation/bloc/order_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static String name = RoutePath.mainScreenPath;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool? isFirstVisit;

  @override
  void initState() {
    super.initState();
    final authBloc = context.read<AuthBloc>();
    if (authBloc.state.isFirstVisit == true) {
      context.read<OrderBloc>().add(GetOrdersEvent(userId: authBloc.state.userId, token: authBloc.state.token));
      context.read<HistoryOrderBloc>().add(GetHistoryOrdersEvent(userId: authBloc.state.userId, token: authBloc.state.token));
    }
  }

  String getDocumentCountText(int count) {
    if (count == 1 || (count % 10 == 1 && count % 100 != 11)) {
      return '$count документ';
    } else if ((count % 10 >= 2 && count % 10 <= 4) && !(count % 100 >= 12 && count % 100 <= 14)) {
      return '$count документа';
    } else {
      return '$count документов';
    }
  }
  @override
  Widget build(BuildContext context) {
    final orderBloc = context.read<OrderBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Главная',
            style: AppTypography.font26Regular.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: BlocBuilder<HistoryOrderBloc, HistoryOrderState>(
        builder: (context, state) {
          List<Widget> notifications = [];

          if (state is HistoryOrderSuccess) {
            final inWorkOrders = state.activeOrders?.where((order) => order?.status == 'in work').toList();
            final readyOrders = state.activeOrders?.where((order) => order?.status == 'ready').toList();

            if (inWorkOrders?.isNotEmpty ?? false) {
              notifications.add(
                CustomNotificationWidget(
                  title: 'Документы в процессе выполнения',
                  subtitle: '${getDocumentCountText(inWorkOrders!.length)}',
                  type: NotificationType.warning,
                  onClose: () {},
                ),
              );
            }

            if (readyOrders?.isNotEmpty ?? false) {
              notifications.add(
                CustomNotificationWidget(
                  title: 'Документы готовы',
                  subtitle: '${getDocumentCountText(readyOrders!.length)}.',
                  type: NotificationType.success,
                  onClose: () {},
                ),
              );
            }

            if ((inWorkOrders?.isEmpty ?? true) && (readyOrders?.isEmpty ?? true)) {
              notifications.add(
                CustomNotificationWidget(
                  title: 'Нет активных заказов',
                  subtitle: 'У вас нет документов в обработке или готовых.',
                  type: NotificationType.error,
                  onClose: () {},
                ),
              );
            }
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (notifications.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: notifications
                            .asMap()
                            .map((index, notification) => MapEntry(
                          index,
                          Padding(
                            padding: EdgeInsets.only(bottom: index == notifications.length - 1 ? 0 : 16),
                            child: notification,
                          ),
                        ))
                            .values
                            .toList(),
                      ),
                    ),
                  GradientBannerWidget(
                    gradient: AppColors.gradientOrangeBackground,
                    title: 'Быстрое оформление документов',
                    description: 'Выберите из ${orderBloc.state.documents?.length ?? 0} образцов',
                    btnText: 'Выбрать',
                    imagePath: ImageAssets.saly,
                    width: 100,
                    onPress: () {
                      context.goNamed(RoutePath.getOrderScreenPath);
                    },
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    height: 160,
                    child: Row(
                      children: [
                        Expanded(
                          child: OtherOptionWidget(
                            title: "Популярные документы",
                            subTitle: "Читать",
                            icon: VectorAssets.icPlansh,
                            onTap: () {
                              context.goNamed(RoutePath.getOrderScreenPath);
                            },
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: OtherOptionWidget(
                            title: "История заказов",
                            subTitle: "Перейти",
                            icon: VectorAssets.icHistory,
                            onTap: () {
                              context.goNamed(RoutePath.historyScreenPath);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
