"""A minimal FastAPI application."""

from importlib import metadata

from fastapi import FastAPI, HTTPException

app = FastAPI(
    title="deadnews-template-python",
    summary="A minimal FastAPI application.",
    version=metadata.version("deadnews_template_python"),
)

HELLO_WORLD: dict[str, str] = {"msg": "Hello World!"}
HEALTH: dict[str, str] = {"status": "OK"}
ITEMS: dict[str, str] = {"1": "sausage", "2": "tofu"}


@app.get("/")
async def read_root() -> dict[str, str]:
    """Handles the `/` route and returns a JSON response."""
    return HELLO_WORLD


@app.api_route("/health", methods=["GET", "HEAD"])
async def read_health() -> dict[str, str]:
    """Handles the `/health` route and returns a JSON response."""
    return HEALTH


@app.get("/items/{item_id}")
async def read_item(item_id: str) -> dict[str, str]:
    """Handles the `/items/{item_id}` route and returns the corresponding value as a JSON response.

    Args:
        item_id: The ID of the item to retrieve from the ITEMS dictionary.

    Returns:
        The corresponding value from the ITEMS dictionary as a JSON response.

    Raises:
        HTTPException: If the item_id is not found in the ITEMS dictionary, raise an HTTPException with a status code of 404.
    """
    if item_id not in ITEMS:
        raise HTTPException(status_code=404, detail="Item not found.")

    return {"item": ITEMS[item_id]}
