#!/usr/bin/env python
from __future__ import annotations

from src.deadnews_python_template import get_answer


def test_get_answer():
    assert get_answer() == 42
