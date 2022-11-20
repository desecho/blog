---
title: "Python Modules Installation"
date: 2014-06-29T03:09:00
comments: true
categories: ["Python", "Web Development"]
keywords: python, installation, modules
---

## Python

Create a `requirements.txt` file with the following format:

```bash
Django==2.0.2
mysql-python>=1.0
-e git+https://github.com/desecho/django-tqdm@1.0.3.git#egg=django-tqdm
# comment
```

Install using command:

```bash
pip install -r requirements.txt
```
