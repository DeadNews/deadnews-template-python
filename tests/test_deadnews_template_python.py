#!/usr/bin/env python
from deadnews_template_python.__main__ import get_answer


def test_get_answer():
    assert get_answer() == 42
