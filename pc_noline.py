import subprocess

# 定义要运行的Shell脚本文件路径（Windows格式）
sh_script_path = r'C:\Users\zad\Desktop\bat_tool\pc_noline.sh'

try:
    # 使用subprocess运行Shell脚本，使用bash来解释执行
    subprocess.run(['bash', sh_script_path], check=True, shell=True)
except subprocess.CalledProcessError as e:
    print(f"Shell脚本运行失败，返回码：{e.returncode}")
except FileNotFoundError:
    print(f"找不到Shell脚本文件：{sh_script_path}")
except Exception as e:
    print(f"发生了错误：{e}")
