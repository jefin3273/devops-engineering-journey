from app import get_response


def test_root():
    status, content_type, body = get_response("/")

    assert status == 200
    assert content_type == "text/plain"
    assert body == "DevOps CI/CD Demo Application"


def test_health():
    status, content_type, body = get_response("/health")

    assert status == 200
    assert content_type == "application/json"
    assert body == '{"status":"healthy"}'


def test_not_found():
    status, content_type, body = get_response("/does-not-exist")

    assert status == 404
