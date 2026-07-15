"""DEMOAI Streamlit application."""

import streamlit as st

from app.database import test_connection


st.set_page_config(
    page_title="DEMOAI Agent",
    page_icon="🧠",
    layout="wide",
)

st.title("DEMOAI Agent")
st.write(
    "Oracle Autonomous Database 26ai vector-search "
    "and agentic AI demonstration."
)

if st.button("Test Database Connection"):
    try:
        result = test_connection()
        st.success("Database connection successful.")
        st.json(result)
    except Exception as exc:
        st.error(f"Database connection failed: {exc}")
