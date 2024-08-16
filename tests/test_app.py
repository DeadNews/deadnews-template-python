import random
from typing import TYPE_CHECKING

import pytest
from starlette import status
from starlette.testclient import TestClient

from deadnews_template_python.app import HEALTH, HELLO_WORLD, ITEMS, app

if TYPE_CHECKING:
    from httpx import Response


@pytest.fixture
def client() -> TestClient:
    return TestClient(app)


def test_read_root(client: TestClient) -> None:
    response: Response = client.get("/")

    assert response.status_code == status.HTTP_200_OK
    assert response.json() == HELLO_WORLD


def test_read_health(client: TestClient) -> None:
    response: Response = client.get("/health")

    assert response.status_code == status.HTTP_200_OK
    assert response.json() == HEALTH


def test_read_item_existing(client: TestClient) -> None:
    key, value = random.choice(list(ITEMS.items()))

    response: Response = client.get(f"/items/{key}")

    assert response.status_code == status.HTTP_200_OK
    assert response.json() == {"item": value}


def test_read_item_non_existing(client: TestClient) -> None:
    response: Response = client.get("/items/non_existing_item")

    assert response.status_code == status.HTTP_404_NOT_FOUND
    assert "Item not found." in response.text
