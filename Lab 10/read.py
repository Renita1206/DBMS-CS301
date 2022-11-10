import pandas as pd
import streamlit as st
import plotly.express as px
from database import view_all_data

def read():
    result = view_all_data()
    # st.write(result) 
    df = pd.DataFrame(result, columns=['TrainNo', 'TrainName', 'Train Type', 'Source', 'Destination', 'Availability']) 
    with st.expander("View all"):
        st.dataframe(df)
    with st.expander("Destination"):
        task_df = df['Destination'].value_counts().to_frame()
        task_df = task_df.reset_index()
        st.dataframe(task_df)
        p1 = px.pie(task_df, names='index', values='Destination')
        st.plotly_chart(p1)