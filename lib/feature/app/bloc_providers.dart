
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:vas_app/feature/main_page/presentation/bloc/profile_bloc.dart';
import 'package:vas_app/feature/order_page/presentation/bloc/order_bloc.dart';


List<BlocProvider> buildListProviders({required GetIt locator}) {
  return <BlocProvider>[
    BlocProvider<ProfileBloc>(
      create: (context) => locator<ProfileBloc>(),
    ),
    BlocProvider<AuthBloc>(
      create: (context) => locator<AuthBloc>(),
    ),
    BlocProvider<OrderBloc>(
      create: (context) => locator<OrderBloc>(),
    ),
  ];
}
