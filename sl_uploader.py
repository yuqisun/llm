import streamlit as st
import os
import pandas as pd
import time
import uuid

# 创建一个存储文件状态的CSV文件，如果不存在的话
FILE_STATUS_CSV = 'file_status.csv'
if not os.path.exists(FILE_STATUS_CSV):
    pd.DataFrame(columns=['id', 'status']).to_csv(FILE_STATUS_CSV, index=False)

# 加载文件状态数据
file_status_data = pd.read_csv(FILE_STATUS_CSV)

# 定义文件状态的枚举
STATUS_UPLOAD = "上传"
STATUS_ANALYZE = "分析"
STATUS_PROCESS = "处理"
STATUS_COMPLETE = "完成"

# Streamlit 应用程序
def main():
    st.title("文件处理应用")

    # 自动生成唯一文件ID
    file_id = str(uuid.uuid4())
    st.write(f"自动生成的唯一文件ID: {file_id}")

    # 初始化进度条，显示四个状态
    progress_bar = st.progress(0.0)

    with st.spinner('初始化中...'):
        # 模拟初始化操作
        time.sleep(2)

    # 显示四个状态
    st.write("1. 上传")
    st.write("2. 分析")
    st.write("3. 处理")
    st.write("4. 完成")

    file_description = st.text_input("请输入文件简介：")
    if st.button("开始处理"):
        # 进度条显示上传状态
        update_progress(progress_bar, 25)

        # 在这里进行文件上传后的处理逻辑，可以加入你的文件分析和处理代码
        # 示例中只是打印文件内容
        with st.spinner('文件上传中...'):
            time.sleep(2)
        st.success("文件上传完成")

        # 将文件状态记录为分析
        update_file_status(file_id, STATUS_ANALYZE)
        update_progress(progress_bar, 50)

        # 在这里添加其他处理逻辑

        # 将文件状态记录为处理
        update_file_status(file_id, STATUS_PROCESS)
        update_progress(progress_bar, 75)

        # 在这里添加其他处理逻辑

        # 将文件状态记录为完成
        update_file_status(file_id, STATUS_COMPLETE)
        update_progress(progress_bar, 100)

        st.success("文件处理完成")

    # 查询文件状态
    file_id_to_query = st.text_input("请输入要查询的文件ID：")
    if st.button("查询文件状态"):
        file_status = get_file_status(file_id_to_query)
        st.write(f"文件ID为 {file_id_to_query} 的当前状态是： {file_status}")

# 辅助函数：更新文件状态
def update_file_status(file_id, status):
    global file_status_data
    file_status_data = pd.read_csv(FILE_STATUS_CSV)  # 重新读取数据以确保最新状态
    file_status_data.loc[file_status_data['id'] == file_id, 'status'] = status
    file_status_data.to_csv(FILE_STATUS_CSV, index=False)

# 辅助函数：获取文件状态
def get_file_status(file_id):
    global file_status_data
    file_status_data = pd.read_csv(FILE_STATUS_CSV)  # 重新读取数据以确保最新状态
    status = file_status_data.loc[file_status_data['id'] == file_id, 'status'].values
    return status[0] if len(status) > 0 else "未找到该文件"

# 辅助函数：更新进度条
def update_progress(progress_bar, value):
    progress_bar.progress(value / 100)

if __name__ == "__main__":
    main()
