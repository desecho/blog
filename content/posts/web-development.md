---
title: "Web Development"
date: 2016-07-13T22:21:00
comments: true
categories: ["Python", "JavaScript", "Web Development"]
keywords: python, javascript, web development
---

## JavaScript

### jQuery

#### Add jQuery Through the Console

```javascript
var jq = document.createElement("script");
jq.src = "https://code.jquery.com/jquery-3.6.0.min.js";
document.getElementsByTagName("head")[0].appendChild(jq);
```

Give time for script to load, then enter

```javascript
jQuery.noConflict();
```

## Python

### Helpful Command to Clean Cache Files if Anything Behaves Strangely

```bash
find . -name "*.pyc" -exec rm -rf {} \;
```

### Kill Debugger

```python
import os; os.system("kill -9 %d" % os.getpid())
```

### Django

#### Management Commands

- `dumpdata [app].[Model] --indent 2 > /[project]/src/[app]/fixtures/[data].json`
- `collectstatic`
- `makemigrations`
  - `[app]` — create initial migration
  - `--empty [app]`
- `createsuperuser`
- `migrate`
  - `--fake [app] [0002]`
  - `--fake-initial [app]`
- `shell`

#### Data Migration Example

```python
from django.db import migrations

def action(apps, schema_editor):
    [Model] = apps.get_model("[app]", "[Model]")

class Migration(migrations.Migration):
    dependencies = [
        ("[app]", "0001_initial"),
    ]

    operations = [
        migrations.RunPython(action),
    ]
```

#### Data Migration Example to Load Fixtures

```python
from django.db import migrations
from django.core.management import call_command


def load_fixture(apps, schema_editor):
    # File name.json in fixtures dir
    call_command("loaddata", "[name]", app_label="[app]")


class Migration(migrations.Migration):

    dependencies = [
        ("[app]", "0001_initial"),
    ]

    operations = [
        migrations.RunPython(load_fixture)
    ]
```

#### How to Setup Internalization

Add to settings:

```python
from django.utils.translation import ugettext_lazy as _
from os.path import dirname, join
SRC_DIR = dirname(dirname(abspath(__file__)))

LANGUAGES = (
    ("en", _("English")),
    ("ru", _("Russian")),
)

LOCALE_PATHS = (join(SRC_DIR, "locale"),)

TEMPLATES = [
    {
        "OPTIONS": {
            "builtins": ["django.templatetags.i18n"],
        },
    },
]

```

Add to templates:

```python
{% trans 'text' %}
{% blocktrans %}Back to '{{ race }}' homepage{% endblocktrans %}
```

To create/update necessary `.po` files:

```bash
python manage.py makemessages -a
```

Install [django-rosetta](https://pypi.python.org/pypi/django-rosetta)

You can then access your translations here — `/rosetta`

##### JavaScript

To create/update necessary `.po` files:

```bash
python manage.py makemessages -a -d djangojs
```

Add to `urls.py`

```python
from django.views.i18n import JavaScriptCatalog

    url(r"^jsi18n/$",
        JavaScriptCatalog.as_view(packages=("moviesapp", ), domain="djangojs"),
        name="javascript-catalog"),

urlpatterns += [
    url(r"^jsi18n/$",
        JavaScriptCatalog.as_view(packages=("[app]", ), domain="djangojs"),
        name="javascript-catalog"),
]
```

Add to templates before any js code:

```html
<script src="{% url 'javascript-catalog' %}"></script>
```

If you also need access to the language in js add:

```html
{% get_current_language as LANGUAGE_CODE %}
<script>
  var language = "{{ LANGUAGE_CODE }}";
</script>
```

To use:

```js
gettext("this is to be translated");
```

Additional info in [django docs](https://docs.djangoproject.com/en/dev/topics/i18n/translation/)

#### Py.test

##### pytest.ini

```ini
[pytest]
DJANGO_SETTINGS_MODULE = app.settings
python_files = test_*
addopts = --nomigrations --reuse-db
```

##### Installation

```bash
pip install pytest-django
```

##### Usage

[Documentation](http://pytest.org/latest/usage.html#usage)

- `py.test --create-db` — with db recreate
- `py.test --ignore=[ignore-dir]` — skip tests in `ignore-dir`
- `py.test -k [test]` — run only `test`

## Services for Your Projects

- [PyPI](https://pypi.python.org) — The Python Package Index.
- [Read the Docs](https://readthedocs.io) — Create, host, and browse the documentation.
- [Transifex](https://www.transifex.com/) — Manage translations, translate content, collaborate with translators, and automate your localization process from one central place.
- [Requires.io](https://requires.io/) — Stop wasting your time by manually keeping track of changelogs. Requires.io keeps your python projects secure by monitoring their dependencies.
- [Gitter](https://gitter.im/) — Gitter is a chat and networking platform that helps to manage, grow and connect communities through messaging, content and discovery.
- [Sentry](https://sentry.io) — Sentry’s real-time error tracking gives you insight into production deployments and information to reproduce and fix crashes.
- [Codecov](https://codecov.io) — Code coverage done right.
- [Re:plain](https://replain.cc) — The simplest live chat in the world.
- [pepy.tech](https://pepy.tech/) — A service that provides badges with a number of downloads.
