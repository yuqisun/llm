import os

import streamlit as st
from streamlit_option_menu import option_menu

st.write("""
# My first app
Hello *world!*
""")

pages = {
    "对话": {
        "icon": "chat"
    },
    "知识库管理": {
        "icon": "hdd-stack"
    },
}

VERSION = 2.1

with st.sidebar:
    st.image(
        os.path.join(
            "img",
            "logo-long-chatchat-trans-v2.png"
        ),
        use_column_width=True
    )
    st.caption(
        f"""<p align="right">当前版本：{VERSION}</p>""",
        unsafe_allow_html=True,
    )
    options = list(pages)
    icons = [x["icon"] for x in pages.values()]

    default_index = 0
    selected_page = option_menu(
        "",
        options=options,
        icons=icons,
        # menu_icon="chat-quote",
        default_index=default_index,
    )

if selected_page in pages:
    print(selected_page)
    if "对话" == selected_page:
        st.markdown("*Streamlit* is **really** ***cool***.")
    elif "知识库管理" == selected_page:
        st.markdown("chat with files")
    # pages[selected_page]["func"](api)

# 安装必要的包：pip install streamlit-option-menu streamlit-chatbox>=1.1.6
