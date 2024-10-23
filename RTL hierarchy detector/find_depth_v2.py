import os
import sys
import re

# 全局变量定义
all_file_list = []
cur_sep = os.path.sep
rtl_folder = 'SRC' + cur_sep
verilog_module_pattern = r"(\w+)\s+\w+\s*\([\s\S]*?\)\;"
depth_file = 'module_depth.txt'
depth_f = open(depth_file, 'w', encoding='utf-8')

def getSubModule(in_file):
    global verilog_module_pattern
    global all_file_list
    match_path = ''
    sub_module_list = []
    with open(in_file, 'r', encoding='utf-8') as f:
        verilog_code = f.read()
    sub_module_matches = re.findall(verilog_module_pattern, verilog_code)
    for match in sub_module_matches:
        if match in ['begin', 'module', 'else', 'STOD_COND', 'PRINTF_COND']:
            continue
        # 查找子模块文件
        for root, dirs, files in os.walk(rtl_folder):
            for file in files:
                if file.startswith(match + '.') and os.path.splitext(file)[1] not in ['.v', '.sv']:
                    match_path = os.path.join(root, file)
                    break
            if not match_path:
                for file in files:
                    if file == match + '.v' or file == match + '.sv':
                        match_path = os.path.join(root, file)
                        break
            if match_path:
                break
        if not match_path:
            continue
        sub_module_list.append(match)
        all_file_list.append(match)
    return sub_module_list

def getAllModule(in_file, depth=1):
    global depth_f
    in_file_tmp = in_file
    sub_list = getSubModule(in_file_tmp)
    if sub_list == []:
        return
    for index_f in sub_list:
        in_f = None
        for root, dirs, files in os.walk(rtl_folder):
            for file in files:
                if file.startswith(index_f + '.') and os.path.splitext(file)[1] not in ['.v', '.sv']:
                    in_f = os.path.join(root, file)
                    break
            if not in_f:
                for file in files:
                    if file == index_f + '.v' or file == index_f + '.sv':
                        in_f = os.path.join(root, file)
                        break
            if in_f:
                break
        if not in_f:
            continue
        sepss = '---|' * (depth - 1)
        strs = '[' + str(depth) + ']' + '  *' + sepss + str(index_f)
        print(strs)
        strs = strs + '\n'
        depth_f.write(strs)
        getAllModule(in_f, depth + 1)

def main():
    global all_file_list
    global rtl_folder
    global depth_f
    print('===========================寻找子模块层次结构脚本===========================')
    arg_count = len(sys.argv)
    if arg_count == 1:
        print('太少参数')
        print('方式一：python3 find_depth.py 子模块顶层文件名')
        print('方式二：python3 find_depth.py 子模块所在文件夹 子模块顶层文件名')
        print('=============END==============')
        return
    elif arg_count == 2:
        print('您使用默认文件夹')
        m_f = sys.argv[1]
    elif arg_count == 3:
        print('您使用自定义文件夹')
        rtl_folder = sys.argv[1] + cur_sep
        m_f = sys.argv[2]
    else:
        print('太多参数')
        print('方式一：python3 find_depth.py 子模块顶层文件名')
        print('方式二：python3 find_depth.py 子模块所在文件夹 子模块顶层文件名')
        print('=============END==============')
        return
    
    in_module_f = rtl_folder + m_f
    top_module = m_f.split('.')[0]
    all_file_list.append(top_module)
    depth_f.write('# 模块引用层次结构图\n')
    depth_f.write(top_module + '\r\n')
    print('顶层模块:', top_module)
    getAllModule(in_module_f)
    depth_f.write('\r\n')
    depth_f.write('\r\n')
    depth_f.write('\r\n')
    depth_f.write('\r\n')
 
    depth_f.write('# 涉及子模块文件名\n')
    inc = 0
    all_file_list = list(set(all_file_list))
    all_file_list.sort()
    for i in all_file_list:
        inc = inc + 1
        a_str = str(inc) + ':' + i
        print(a_str)
        a_str = a_str + '\n'
        depth_f.write(a_str)
    print('=============END==============')
    depth_f.close()
    return 0

if __name__ == '__main__':
    main()