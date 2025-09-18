// lib/core/presentation/design_system/gallery/textfield_gallery.dart
import "package:flutter/material.dart";
import "package:minds2_ui_v3/core/presentation/design_system/components/ds_gap.dart";
import "package:minds2_ui_v3/core/presentation/design_system/components/ds_text.dart";
import "package:minds2_ui_v3/core/presentation/design_system/tokens/spacing_tokens.dart";

class DSTextFieldGallery extends StatefulWidget {
  const DSTextFieldGallery({super.key});

  @override
  State<DSTextFieldGallery> createState() => _DSTextFieldGalleryState();
}

class _DSTextFieldGalleryState extends State<DSTextFieldGallery> {
  final _cDefault = TextEditingController();
  final _cFocused = TextEditingController(text: "");
  final _cWithLabel = TextEditingController();
  final _cError = TextEditingController(text: "Value");
  final _cDisabled = TextEditingController(text: "Disabled");
  final _cPrefix = TextEditingController();
  final _cSuffix = TextEditingController();
  final _cHelper = TextEditingController();

  @override
  void dispose() {
    _cDefault.dispose();
    _cFocused.dispose();
    _cWithLabel.dispose();
    _cError.dispose();
    _cDisabled.dispose();
    _cPrefix.dispose();
    _cSuffix.dispose();
    _cHelper.dispose();
    super.dispose();
  }

  Widget _tile(String title, Widget child) {
    return SizedBox(
      width: 320, // 👈 si quieres, podemos tokenizar tamaños fijos después
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DSText.input(title),
          const DSGap.md(), // 8
          child,
        ],
      ),
    );
  }

  InputDecoration _dec({
    String? hint,
    String? label,
    String? helper,
    String? error,
    IconData? prefix,
    IconData? suffix,
    VoidCallback? onSuffixTap,
  }) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      helperText: helper,
      errorText: error,
      prefixIcon: prefix != null ? Icon(prefix) : null,
      suffixIcon: suffix != null
          ? IconButton(
              onPressed: onSuffixTap,
              icon: Icon(suffix),
              splashRadius: DSSpacing.lg, // 24 → target táctil DS
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: DSText.labels("DS TextField — Gallery")),
      body: Padding(
        padding: const EdgeInsets.all(DSSpacing.lg), // 24 DS
        child: Wrap(
          spacing: DSSpacing.lg, // 24 DS
          runSpacing: DSSpacing.lg, // 24 DS
          children: [
            _tile(
              "Default",
              TextField(
                controller: _cDefault,
                decoration: _dec(hint: "Search"),
              ),
            ),
            _tile(
              "Focused",
              TextField(
                controller: _cFocused,
                autofocus: true,
                decoration: _dec(hint: "Search"),
              ),
            ),
            _tile(
              "With label",
              TextField(
                controller: _cWithLabel,
                decoration: _dec(hint: "Search", label: "Search"),
              ),
            ),
            _tile(
              "Error",
              TextField(
                controller: _cError,
                decoration: _dec(hint: "Search", error: "Required"),
              ),
            ),
            _tile(
              "Disabled",
              TextField(
                controller: _cDisabled,
                enabled: false,
                decoration: _dec(hint: "Search"),
              ),
            ),
            _tile(
              "Prefix icon",
              TextField(
                controller: _cPrefix,
                decoration: _dec(hint: "Search", prefix: Icons.search),
              ),
            ),
            _tile(
              "Suffix (clear)",
              TextField(
                controller: _cSuffix,
                decoration: _dec(
                  hint: "Search",
                  suffix: Icons.close_rounded,
                  onSuffixTap: () => setState(() => _cSuffix.clear()),
                ),
              ),
            ),
            _tile(
              "Helper",
              TextField(
                controller: _cHelper,
                decoration: _dec(
                  hint: "Search",
                  helper: "Helper text clarifying the field",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
