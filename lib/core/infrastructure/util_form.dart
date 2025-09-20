import "package:minds2_ui_v3/core/domain/custom_types.dart";
import "package:reactive_forms/reactive_forms.dart";

Json getFlatFormValues(FormArray formArray, Json query) {
  final raw = formArray.rawValue;
  for (final r in raw) {
    query.addAll(r as Json);
  }
  return query;
}
