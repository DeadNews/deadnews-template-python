#!/usr/bin/env python
from __future__ import annotations

from deadnews_template_python import get_answer


def test_get_answer():
    assert get_answer() == 42
