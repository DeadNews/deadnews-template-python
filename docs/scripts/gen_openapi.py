#!/usr/bin/env python
"""Generate the OpenAPI schema for the FastAPI app."""

import importlib
import json

import mkdocs_gen_files

app = importlib.import_module("deadnews_template_python").app

with mkdocs_gen_files.open("openapi.json", "w") as fd:
    json.dump(app.openapi(), fd, indent=2)

with mkdocs_gen_files.open("openapi.md", "w") as fd:
    fd.write('<swagger-ui src="./openapi.json"/>\n')
