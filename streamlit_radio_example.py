import streamlit as st

def main():
    st.title("Hide Radio Button Example")

    show_radio = st.checkbox("Show Radio Button")

    if show_radio:
        color = st.radio("Select a color", ["Red", "Green", "Blue"])
        st.write(f"You selected {color}!")
    else:
        st.write("Radio button is hidden.")

if __name__ == "__main__":
    main()
