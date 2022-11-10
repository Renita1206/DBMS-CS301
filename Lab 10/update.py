import pandas as pd
import streamlit as st
from database import view_all_data, view_only_train_no, get_train, edit_train_data

def update():
    result = view_all_data()
    df = pd.DataFrame(result, columns=['TrainNo', 'TrainName', 'Train Type', 'Source', 'Destination', 'Availability'])
    with st.expander("Train"):
        st.dataframe(df)
        list_of_trains = [i[0] for i in view_only_train_no()]
        selected_train = st.selectbox("Train to Edit", list_of_trains)
        selected_result = get_train(selected_train)
    if selected_result:
        train_no = selected_result[0][0]
        train_name = selected_result[0][1]
        train_type = selected_result[0][2]
        source = selected_result[0][3]
        destination = selected_result[0][4]
        availability = selected_result[0][5]
        col1, col2 = st.columns(2)
        with col1:
            new_trainNo = st.text_input("Train Number:", train_no)
            new_train_name = st.text_input("Train Name:", train_name)
            new_train_type = st.text_input("Train Type:", train_type)
        with col2:
            new_source = st.text_input("Source: ", source)
            new_destination = st.text_input("Destination:", destination)
            new_avail = st.selectbox("Availability", ["Yes", "No"])
        if st.button("Update Dealer"):
            edit_train_data(new_trainNo, new_train_name, new_train_type, new_source, new_destination, 
            new_avail, train_no, train_name)
            st.success("Successfully updated:: {} to ::{}".format(train_no, new_trainNo))
            result2 = view_all_data()
            df2 = pd.DataFrame(result2, columns=['TrainNo', 'Train Name', 'Train Type', 'Source', 'Destination', 'Availability'])
            with st.expander("Updated data"):
                st.dataframe(df2)