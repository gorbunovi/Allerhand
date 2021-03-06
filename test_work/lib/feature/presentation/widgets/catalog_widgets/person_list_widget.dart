import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/common/app_colors.dart';
import 'package:test_work/feature/domain/entities/person_entity.dart';
import 'package:test_work/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:test_work/feature/presentation/bloc/person_list_cubit/person_list_state.dart';
import 'package:test_work/feature/presentation/widgets/catalog_widgets/person_card_widget.dart';

class PersonsList extends StatelessWidget {
  final scrollController = ScrollController();
  final int page = -1;

  PersonsList({Key? key}) : super(key: key);
  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<PersonListCubit>().loadPerson();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);

    return BlocBuilder<PersonListCubit, PersonState>(builder: (context, state) {
      List<PersonEntity> persons = [];
      bool isLoading = false;

      if (state is PersonLoading && state.isFirstFetch) {
        return _loadingIndicator();
      } else if (state is PersonLoading) {
        persons = state.oldPersonsList;
        isLoading = true;
      } else if (state is PersonLoaded) {
        persons = state.personsList;
      } else if (state is PersonError) {
        return Text(
          state.message,
          style: const TextStyle(color: AppColors.textBlack, fontSize: 25),
        );
      }
      return ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < persons.length) {
            return PersonCard(person: persons[index], index: index,);
          } else {

            return _loadingIndicator();
          }
        },
        itemCount: persons.length + (isLoading ? 1 : 0),
      );
    });
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(color: AppColors.backgroundColor,),
      ),
    );
  }
}
