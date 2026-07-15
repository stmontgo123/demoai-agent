"""Application configuration loaded from environment variables."""

from dataclasses import dataclass
import os

from dotenv import load_dotenv


load_dotenv()


@dataclass(frozen=True)
class Settings:
    db_user: str
    db_password: str
    db_dsn: str
    app_env: str
    app_host: str
    app_port: int
    log_level: str
    oci_region: str
    oci_namespace: str
    oci_bucket_name: str


def get_settings() -> Settings:
    """Load and validate required application settings."""

    settings = Settings(
        db_user=os.getenv("DB_USER", "DEMO"),
        db_password=os.getenv("DB_PASSWORD", ""),
        db_dsn=os.getenv("DB_DSN", ""),
        app_env=os.getenv("APP_ENV", "development"),
        app_host=os.getenv("APP_HOST", "127.0.0.1"),
        app_port=int(os.getenv("APP_PORT", "8501")),
        log_level=os.getenv("LOG_LEVEL", "INFO"),
        oci_region=os.getenv("OCI_REGION", ""),
        oci_namespace=os.getenv("OCI_NAMESPACE", ""),
        oci_bucket_name=os.getenv(
            "OCI_BUCKET_NAME",
            "demoai-artifacts",
        ),
    )

    missing = []

    if not settings.db_user:
        missing.append("DB_USER")

    if not settings.db_password:
        missing.append("DB_PASSWORD")

    if not settings.db_dsn:
        missing.append("DB_DSN")

    if missing:
        raise RuntimeError(
            "Missing required environment variables: "
            + ", ".join(missing)
        )

    return settings
