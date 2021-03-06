---
title: "Web Development"
date: 2016-07-13T22:21:00
comments: true
categories: ['Python', 'JavaScript', 'Web Development']
keywords: python, javascript, web development

---
## Javascript

### jQuery
#### Add jQuery through console

```javascript
var jq = document.createElement('script');
jq.src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js";
document.getElementsByTagName('head')[0].appendChild(jq);
// ... give time for script to load, then type.
jQuery.noConflict();
```

#### Extend jQuery

```javascript
$.fn.visible = function() {
    return this.css('visibility', 'visible');
};

$.fn.invisible = function() {
    return this.css('visibility', 'hidden');
};
```

## Python

### Helpful command if anything behaves strangely
```bash
find . -name "*.pyc" -exec rm -rf {} \;
```

### Kill Debugger
```python
import os; os.system('kill -9 %d' % os.getpid())
```

### Django

#### Management commands

* `dumpdata [app].[Model] --indent 2 > /[project]/src/[app]/fixtures/[data].json`
* `collectstatic`
* `makemigrations`
    - `[app] # create initial migration`
    - `--empty [app]`
* `createsuperuser`
* `migrate`
    - `--fake [app] [0002]`
    - `--fake-initial [app]`
* `shell`

#### Data migration example
```python
from django.db import migrations

def action(apps, schema_editor):
    [Model] = apps.get_model('[app]', '[Model]')

class Migration(migrations.Migration):
    dependencies = [
        ('[app]', '0001_initial'),
    ]

    operations = [
        migrations.RunPython(action),
    ]
```

#### Data migration example to load fixtures

```python
from django.db import migrations
from django.core.management import call_command


def load_fixture(apps, schema_editor):
    # File name.json in fixtures dir
    call_command('loaddata', '[name]', app_label='[app]')


class Migration(migrations.Migration):

    dependencies = [
        ('[app]', '0001_initial'),
    ]

    operations = [
        migrations.RunPython(load_fixture)
    ]
```

#### HOWTO setup internalization
Add to settings:

```python
from django.utils.translation import ugettext_lazy as _
import os.path as op

LANGUAGES = (
    ('en', _('English')),
    ('ru', _('Russian')),
)

LOCALE_PATHS = (
    op.join(local_settings.PROJECT_ROOT, 'project', 'src', 'locale'),
)
```

Add to templates:

```
{% load i18n %}

{% trans 'text' %}
{% blocktrans %}Back to '{{ race }}' homepage{% endblocktrans %}
```

To create/update necessary `.po` files:

```bash
python manage.py makemessages
```

Install [django-rosetta](https://pypi.python.org/pypi/django-rosetta)

You can then access your translations here - `/rosetta`

##### JS

To create/update necessary `.po` files:

```bash
python manage.py makemessages -d djangojs
```

urls.py

```python
from django.views.i18n import JavaScriptCatalog

    url(r'^jsi18n/$',
        JavaScriptCatalog.as_view(packages=('moviesapp', ), domain='djangojs'),
        name='javascript-catalog'),

urlpatterns += [
    url(r'^jsi18n/$',
        JavaScriptCatalog.as_view(packages=('[app]', ), domain='djangojs'),
        name='javascript-catalog'),
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
    var language = '{{ LANGUAGE_CODE }}';
  </script>
```

To use:

```js
gettext('this is to be translated');
```

Additional info in [django docs](https://docs.djangoproject.com/en/dev/topics/i18n/translation/)

#### Py.test

##### pytest.ini

```ini
[pytest]
DJANGO_SETTINGS_MODULE = settings
python_paths = apps
python_files = tests.py
addopts = --nomigrations --reuse-db
```

##### Install
```bash
pip install pytest-django
```

##### Usage
[Documentation](http://pytest.org/latest/usage.html#usage)

```bash
# With db recreate
py.test --create-db

# To ignore directory
py.test --ignore=apps/app_name

# To run only test_function from apps/app_name directory
py.test apps/app_name -k test_function --create-db
```

## Services for your projects.
* [PyPI](https://pypi.python.org) - the Python Package Index
* [Read the Docs](https://readthedocs.io) - Create, host, and browse documentation.
* [Transifex](https://www.transifex.com/) - Manage translations, translate content, collaborate with translators, and automate your localization process from one central place.
* [Requires.io](https://requires.io/) - Stop wasting your time by manually keeping track of changelogs. Requires.io keeps your python projects secure by monitoring their dependencies.
* [Gitter](https://gitter.im/) - Gitter is a chat and networking platform that helps to manage, grow and connect communities through messaging, content and discovery.
* [Sentry](https://sentry.io) - Sentry’s real-time error tracking gives you insight into production deployments and information to reproduce and fix crashes.
* [Say Thanks](https://saythanks.io/) - SayThanks.io provides a handy URL for you to share with your open source projects— it encourages users to send a simple thank you note to you, the creator of that project.
* [Healthchecks](https://healthchecks.io/) - Cron Monitoring. Get Notified When Your Cron Jobs Fail.
* [Travis CI](https://travis-ci.org) - Test and Deploy with Confidence. Easily sync your GitHub projects with Travis CI and you’ll be testing your code in minutes!
* [Codecov](https://codecov.io) - Code coverage done right.
* [Re:plain](https://replain.cc) - The simplest live chat in the world.
* [pepy.tech](https://pepy.tech/) - Service which provides badges with number of downloads.