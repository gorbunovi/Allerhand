import 'package:flutter/material.dart';
import 'package:test_work/common/app_colors.dart';
import 'package:test_work/feature/domain/entities/person_entity.dart';
import 'package:test_work/feature/presentation/widgets/catalog_widgets/cashe_image_widget.dart';
import 'package:test_work/feature/presentation/widgets/catalog_widgets/sing_out_widget.dart';

class PersonDetailPage extends StatelessWidget {
  final PersonEntity person;

  const PersonDetailPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.textWhite,
        actions: [SingOut(context),],
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: AppColors.textWhite,
        child: Center(
          child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(const Color(0xff333333))),
            onPressed: (){Navigator.of(context).pop();},
            child: const Text('Назад', style: TextStyle(color: AppColors.textWhite),),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // const SizedBox(
            //   height: 10,
            // ),
            PersonCacheImage(
              width: 260,
              height: 260,
              imageUrl: person.image,
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              thickness: 2,
              color: Colors.black45,
            ),
            Text(
              person.name,
              style: const TextStyle(
                fontSize: 28,
                color: AppColors.textBlack,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    color: person.status == 'Alive' ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  person.status,
                  style: const TextStyle(
                    color: AppColors.textBlack,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            if (person.type.isNotEmpty) ...buildText('Type:', person.type),
            ...buildText('Gender:', person.gender,),
            ...buildText(
                'Number of episodes: ', person.episode.length.toString()),
            ...buildText('Species:', person.species),
            ...buildText('Last known location:', person.location.name),
            ...buildText('Origin:', person.origin.name),
            ...buildText('Was created:', person.created.toString()),
          ],
        ),
      ),
    );
  }

  List<Widget> buildText(String text, String value) {
    return [
      Text(
        text,
        style: const TextStyle(
          color: AppColors.greyColor,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        value,
        style: const TextStyle(
          color: AppColors.textBlack,
        ),
      ),
      const SizedBox(
        height: 12,
      ),
    ];
  }
}
