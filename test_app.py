from app import app


def test_health():
    # Create a test client to simulate HTTP requests
    client = app.test_client()
    response = client.get("/health")
    # Verify the endpoint returns 200 and the expected JSON
    assert response.status_code == 200
    assert response.get_json()["status"] == "healthy"

def test_home():
    # Create a test client for the home endpoint
    client = app.test_client()
    response = client.get("/")
    # Verify the rendered home page is returned
    assert response.status_code == 200
    assert b"CI/CD Pipeline" in response.data

