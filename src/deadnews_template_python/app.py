#!/usr/bin/env python
"""Minimal FastAPI application."""
from fastapi import FastAPI, HTTPException

app = FastAPI()

HELLO_WORLD: dict[str, str] = {"msg": "Hello World!"}
HEALTH: dict[str, str] = {"status": "OK"}
ITEMS: dict[str, str] = {"1": "sausage", "2": "tofu"}


@app.get("/")
def read_root() -> dict[str, str]:
    """Handles the "/" route and returns a JSON response."""
    return HELLO_WORLD


@app.get("/health")
def read_health() -> dict[str, str]:
    """Handles the "/health" route and returns a JSON response."""
    return HEALTH


@app.get("/items/{item_id}")
def read_item(item_id: str) -> str:
    """
    Handles the "/items/{item_id}" route and returns the corresponding value as an HTML response.

    Args:
        item_id (str): The ID of the item to retrieve from the ITEMS dictionary.

    Returns:
        str: The corresponding value from the ITEMS dictionary as a string.

    Raises:
        HTTPException: If the item_id is not found in the ITEMS dictionary, raise an HTTPException with a status code of 404.
    """
    if item_id in ITEMS:
        return ITEMS[item_id]

    raise HTTPException(status_code=404, detail="Item not found.")
