from django.core.validators import RegexValidator, _lazy_re_compile

hsl_re = _lazy_re_compile(r'^(\d+),\s*([\d.]+)%,\s*([\d.]+)%\Z')
validate_hsl_color = RegexValidator(
    hsl_re,
    "Enter a valid 'HSL' consisting of hue 0-360, saturation 0%-100%, lightness 0%-100%",
    'invalid'
)