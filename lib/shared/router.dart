import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackaton/features/create_treatment/presentation/create_treatment_view.dart';
import 'package:hackaton/features/home/presentation/home_view.dart';
import 'package:hackaton/features/home_patient/presentation/home_patient_view.dart';
import 'package:hackaton/features/login/presentation/decision_view.dart';
import 'package:hackaton/features/login/presentation/doctor_form.dart';
import 'package:hackaton/features/login/presentation/patient_form.dart';
import 'package:hackaton/features/patient_detail/presentation/patient_detail_view.dart';
import 'package:hackaton/features/register_patient/presentation/register_patient_view.dart';
import 'package:hackaton/models/patient.dart';

// import 'auth.dart';
// import 'main.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  // final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: LoginDecisionView.routeLocation,
    routes: [
      // GoRoute(
      //   path: SplashPage.routeLocation,
      //   name: SplashPage.routeName,
      //   builder: (context, state) {
      //     return const SplashPage();
      //   },
      // ),
      GoRoute(
        path: HomePatientView.routeLocation,
        name: HomePatientView.routeName,
        builder: (context, state) {
          return HomePatientView(
            patient: state.extra as Patient,
          );
        },
      ),
      GoRoute(
        path: HomePage.routeLocation,
        name: HomePage.routeName,
        builder: (context, state) {
          return const HomePage();
        },
        routes: [
          GoRoute(
            path: RegisterPatientView.routeLocation,
            name: RegisterPatientView.routeName,
            builder: (context, state) {
              return const RegisterPatientView();
            },
          ),
          GoRoute(
            path: PatientDetailsView.routeLocation,
            name: PatientDetailsView.routeName,
            builder: (context, state) {
              return PatientDetailsView(
                patient: state.extra as Patient,
              );
            },
          ),
          GoRoute(
            path: CreateTreatmentView.routeLocation,
            name: CreateTreatmentView.routeName,
            builder: (context, state) {
              return CreateTreatmentView(
                patient: state.extra as Patient,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: LoginDecisionView.routeLocation,
        name: LoginDecisionView.routeName,
        builder: (context, state) {
          return const LoginDecisionView();
        },
        routes: [
          GoRoute(
            path: DoctorForm.routeLocation,
            name: DoctorForm.routeName,
            builder: (context, state) {
              return const DoctorForm();
            },
          ),
          GoRoute(
            path: PatientForm.routeLocation,
            name: PatientForm.routeName,
            builder: (context, state) {
              return const PatientForm();
            },
          ),
        ],
      ),
      // GoRoute(
      //   path: LoginPage.routeLocation,
      //   name: LoginPage.routeName,
      //   builder: (context, state) {
      //     return const LoginPage();
      //   },
      // ),
    ],
    redirect: (context, state) {
      return null;

      // // If our async state is loading, don't perform redirects, yet
      // if (authState.isLoading || authState.hasError) return null;

      // // Here we guarantee that hasData == true, i.e. we have a readable value

      // // This has to do with how the FirebaseAuth SDK handles the "log-in" state
      // // Returning `null` means "we are not authorized"
      // final isAuth = authState.valueOrNull != null;

      // final isSplash = state.location == SplashPage.routeLocation;
      // if (isSplash) {
      //   return isAuth ? HomePage.routeLocation : LoginPage.routeLocation;
      // }

      // final isLoggingIn = state.location == LoginPage.routeLocation;
      // if (isLoggingIn) return isAuth ? HomePage.routeLocation : null;

      // return isAuth ? null : SplashPage.routeLocation;
    },
  );
});
