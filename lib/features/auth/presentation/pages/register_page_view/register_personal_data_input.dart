import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:upray_mobile/core/presentation/widgets/custom_text_form_field.dart';
import 'package:upray_mobile/core/presentation/widgets/gap.dart';
import 'package:upray_mobile/gen/strings.g.dart';

class RegisterPersonalDataInput extends StatelessWidget {
  RegisterPersonalDataInput({super.key, required this.onSaved, required this.formKey});

  final Function(
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
  ) onSaved;

  final GlobalKey formKey;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dayOfBirthNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.t.auth.makeTheJourneyYours,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Gap(4.0),
          Text(
            context.t.auth.personalDataHeader,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Gap(32.0),
          CustomTextFormField(
            controller: _firstNameController,
            autocorrect: true,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            autofillHints: const [AutofillHints.name],
            textLabel: context.t.auth.firstName,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            onSaved: (_) => _onSaved(),
            decoration: InputDecoration(
              hintText: context.t.auth.firstName,
            ),
          ),
          const Gap(16.0),
          CustomTextFormField(
            controller: _lastNameController,
            autocorrect: false,
            textLabel: context.t.auth.lastName,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            autofillHints: const [AutofillHints.familyName],
            decoration: InputDecoration(hintText: context.t.auth.lastName),
          ),
          const Gap(16.0),
          CustomTextFormField(
            readOnly: true,
            controller: _dayOfBirthNameController,
            onTap: () => _onDateTap(context),
            textLabel: context.t.auth.dateOfBirthLabel,
            decoration: InputDecoration(
              hintText: context.t.auth.dateOfBirthHint,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onDateTap(BuildContext context) async {
    final size = MediaQuery.of(context).size;
    var resultDate = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarViewMode: CalendarDatePicker2Mode.year,
        lastDate: DateTime.now().subtract(
          const Duration(days: 365 * 18),
        ),
        firstDate: DateTime.now().subtract(
          const Duration(days: 365 * 115),
        ),
      ),
      dialogSize: Size(size.width * 0.8, size.height * 0.3),
      borderRadius: BorderRadius.circular(15),
    );

    if (resultDate?.isNotEmpty ?? false) {
      _dayOfBirthNameController.text = DateFormat('y-MM-d').format(resultDate!.first!);
    }
  }

  void _onSaved() {
    onSaved.call(
      _firstNameController.value.text.isEmpty ? null : _firstNameController.value.text,
      _lastNameController.value.text.isEmpty ? null : _lastNameController.value.text,
      DateTime.tryParse(_dayOfBirthNameController.value.text),
    );
  }
}
