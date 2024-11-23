
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vas_app/feature/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:vas_app/feature/main_page/presentation/bloc/profile_bloc.dart';


List<BlocProvider> buildListProviders({required GetIt locator}) {
  return <BlocProvider>[
    BlocProvider<ProfileBloc>(
      create: (context) => locator<ProfileBloc>(),
    ),
    BlocProvider<AuthBloc>(
      create: (context) => locator<AuthBloc>(),
    ),
    // BlocProvider<HotelRoomBloc>(
    //   create: (context) => locator<HotelRoomBloc>(),
    // ),
    // BlocProvider<HotelRoomCubit>(
    //   create: (context) => locator<HotelRoomCubit>(),
    // ),
    // BlocProvider<LuggageBloc>(
    //   create: (context) => locator<LuggageBloc>(),
    // ),
  ];
}
