import 'package:flutter/material.dart';
import 'package:test_work/common/app_colors.dart';
import 'package:test_work/feature/domain/entities/person_entity.dart';
import 'package:test_work/feature/presentation/pages/detail_page.dart';
import 'package:test_work/feature/presentation/widgets/catalog_widgets/cashe_image_widget.dart';

class PersonCard extends StatelessWidget {
  final PersonEntity person;
  final int index;

  const PersonCard({Key? key, required this.person, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(
            builder: (context) => PersonDetailPage(person: person),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.cellBackground,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Text(
              '#${index+1}',
              style: const TextStyle(color: AppColors.textWhite, fontSize: 20),
            ),
            const SizedBox(
              width: 10,
            ),
            const VerticalDivider(
              thickness: 2,
              color: AppColors.textWhite,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    person.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.textWhite,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: person.status == 'Alive'
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          '${person.status} - ${person.species}',
                          style: const TextStyle(color: AppColors.textWhite),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Last known location:',
                    style: TextStyle(color: AppColors.greyColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    person.location.name,
                    style: const TextStyle(color: AppColors.textWhite),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Origin:',
                    style: TextStyle(
                      color: AppColors.greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    person.origin.name,
                    style: const TextStyle(color: AppColors.textWhite),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
