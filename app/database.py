"""Oracle Autonomous Database connection helpers."""

from contextlib import contextmanager
from typing import Iterator

import oracledb

from app.config import get_settings


@contextmanager
def get_connection() -> Iterator[oracledb.Connection]:
    """Open and safely close an Oracle Database connection."""

    settings = get_settings()

    connection = oracledb.connect(
        user=settings.db_user,
        password=settings.db_password,
        dsn=settings.db_dsn,
    )

    try:
        yield connection
    finally:
        connection.close()


def test_connection() -> dict[str, str]:
    """Test connectivity and return basic database information."""

    sql = """
        SELECT
            SYS_CONTEXT('USERENV', 'CURRENT_USER') AS current_user,
            SYS_CONTEXT('USERENV', 'SERVICE_NAME') AS service_name,
            SYS_CONTEXT('USERENV', 'DB_NAME') AS database_name
        FROM dual
    """

    with get_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute(sql)
            current_user, service_name, database_name = cursor.fetchone()

    return {
        "current_user": current_user,
        "service_name": service_name,
        "database_name": database_name,
    }
