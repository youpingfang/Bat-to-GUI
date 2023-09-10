import tkinter as tk
from tkinter import ttk
import os
import subprocess
import sys

# 获取可执行文件所在的目录
if getattr(sys, 'frozen', False):
    current_directory = os.path.dirname(sys.executable)
else:
    current_directory = os.path.dirname(__file__)
    
# 创建主窗口
root = tk.Tk()
root.title("预装组测试工具 : 郑安东00021417")
root.geometry("750x600")
 
# 创建用于显示输出的文本框
output_text = tk.StringVar()
output_label = tk.Label(root, textvariable="", font=("Arial", 12))
explanation_label = tk.Label(root, text="使用方法：1.若目录下新增bat脚本,重启程序会增添按钮 2.脚本名称不易过长", font=("黑体", 12))
explanation_label.pack(pady=10)   

# 递归遍历目录及其子目录，找到所有以 .bat 结尾的脚本文件
def find_bat_scripts(directory):
    bat_scripts = []
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(".bat"):
                bat_scripts.append(os.path.join(root, file))
    return bat_scripts

# 定义执行BAT脚本的函数
def execute_bat_script(script_name):
    try:
        script_path = os.path.join(current_directory, script_name)
        # 使用subprocess.Popen启动CMD进程来执行BAT脚本
        subprocess.Popen(["cmd", "/c", "start", "cmd", "/c", script_path], shell=True)
    except Exception as e:
        output_text.set("执行脚本时发生异常：" + str(e))


# 获取当前目录及其子目录中的所有 .bat 脚本文件
bat_scripts = find_bat_scripts(current_directory)

# 创建BAT脚本按钮网格，每行4个按钮
buttons_frame = ttk.Frame(root)
buttons_frame.pack()
# 去除文件扩展名的函数
def remove_extension(filename):
    return os.path.splitext(filename)[0]

row_num = 0  # 当前行数
col_num = 0  # 当前列数

for script_path in bat_scripts:
    script_name = os.path.basename(script_path)  # 获取脚本文件名
    button_text = remove_extension(script_name)  # 去除文件扩展名
    button = ttk.Button(buttons_frame, text=button_text, command=lambda path=script_path: execute_bat_script(path), style='TButton')
    button.grid(row=row_num, column=col_num, padx=10, pady=10)
    col_num += 1
    if col_num == 4:
        col_num = 0
        row_num += 1
# 创建样式来自定义按钮外观
style = ttk.Style()
style.configure('TButton', foreground='black', background='#6959CD',font=("黑体", 12), padding=(15, 7))

# 运行主循环
root.mainloop()
