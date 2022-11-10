import streamlit as st
from database import add_data
def create():
    col1, col2 = st.columns(2)
    with col1:
        train_no = st.text_input("Train No. :")
        train_name = st.text_input("Train Name:")
        train_type = st.text_input("Train Type: ")
    with col2:
        source = st.text_input("Source: ")
        dest = st.text_input("Destination:")
        avail = st.selectbox("Availability", ["Yes", "No"])
    if st.button("Add Train"):
        add_data(train_no, train_name, train_type, source, dest, avail)
        st.success("Successfully added dealer: {}".format(train_name))