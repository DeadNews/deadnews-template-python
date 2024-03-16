#!/usr/bin/env python
"""Generate the OpenAPI schema for the FastAPI app."""

import importlib
import json
from pathlib import Path

app = importlib.import_module("deadnews_template_python").app
docs = Path(__file__).parent.parent

with Path(docs / "openapi.json").open("w") as f:
    json.dump(app.openapi(), f, indent=2)
