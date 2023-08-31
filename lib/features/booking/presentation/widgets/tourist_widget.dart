import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:hotel_test/res/assets/assets.gen.dart';
import 'package:hotel_test/res/assets/colors.gen.dart';
import 'package:hotel_test/theme/app_typography.dart';
import 'package:hotel_test/widgets/text_field_app.dart';

class TouristWidget extends StatefulWidget {
  int num;

  TouristWidget({required this.num, super.key});

  @override
  State<TouristWidget> createState() => _TouristWidgetState();
}

class _TouristWidgetState extends State<TouristWidget> {
  static const _collapsedHeight = 58.0;
  static const _expandedHeight = 452.0;

  bool _isExpanded = false;
  final Duration _duration = const Duration(seconds: 1);

  void _toggleCard() => setState(() => _isExpanded = !_isExpanded);

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController citizenshipController = TextEditingController();
  TextEditingController numberPassportController = TextEditingController();
  TextEditingController datePassportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration,
      height: _isExpanded ? _expandedHeight : _collapsedHeight,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: ColorName.white,
      ),
      // margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 13,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${number(widget.num)}',
                  style: AppTypography.proDisplayMedium22,
                ),
                GestureDetector(
                  onTap: _toggleCard,
                  child: AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: _duration,
                      child: Assets.icons.arrowBotom.svg()),
                ),
              ],
            ),
            const SizedBox(height: 10),
            AnimatedCrossFade(
              firstChild: const SizedBox(width: double.infinity),
              secondChild: Column(
                children: [
                  FieldApp(
                    validator: (val) {
                      if (!val!.isNotEmpty) {
                        return '';
                      }
                      return null;
                    },
                    controller: nameController,
                    labelText: 'Имя',
                  ),
                  const SizedBox(height: 8),
                  FieldApp(
                    validator: (val) {
                      if (!val!.isNotEmpty) {
                        return '';
                      }
                      return null;
                    },
                    controller: surnameController,
                    labelText: 'Фамилия',
                  ),
                  const SizedBox(height: 8),
                  FieldApp(
                    validator: (val) {
                      if (!val!.isNotEmpty) {
                        return '';
                      }
                      return null;
                    },
                    inputFormater: [MaskedInputFormatter('##.##.####')],
                    controller: dateOfBirthController,
                    labelText: 'Дата рождения',
                  ),
                  const SizedBox(height: 8),
                  FieldApp(
                    validator: (val) {
                      if (!val!.isNotEmpty) {
                        return '';
                      }
                      return null;
                    },
                    controller: citizenshipController,
                    labelText: 'Гражданство',
                  ),
                  const SizedBox(height: 8),
                  FieldApp(
                    validator: (val) {
                      if (!val!.isNotEmpty) {
                        return '';
                      }
                      return null;
                    },
                    inputFormater: [MaskedInputFormatter('####-####-######')],
                    controller: numberPassportController,
                    labelText: 'Номер загранпаспорта',
                  ),
                  const SizedBox(height: 8),
                  FieldApp(
                    validator: (val) {
                      if (!val!.isNotEmpty) {
                        return '';
                      }
                      return null;
                    },
                    inputFormater: [MaskedInputFormatter('##.##.####')],
                    controller: datePassportController,
                    labelText: 'Срок действия загранпаспорта',
                  ),
                ],
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: _duration,
            ),
          ],
        ),
      ),
    );
  }
}

number(int num) {
  switch (num) {
    case 0:
      return 'Первый турист';
    case 1:
      return 'Второй турист';
    case 2:
      return 'Третий турист';
    case 3:
      return 'Четвертый турист';
    case 4:
      return 'Пятый турист';
    case 5:
      return 'Шестой турист';
    case 6:
      return 'Седьмой турист';
    case 7:
      return 'Восьмой турист';
    case 8:
      return 'Девятый турист';
    case 9:
      return 'Десятый турист';
  }
}
