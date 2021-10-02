% # 假设data为矩阵
% # 1、将矩阵变量转为table
data_table = array2table(fengzhi)
% data_table = array2table(fengzhi)
% # 2、将data_table写入csv文件
writetable(data_table, "filename.csv")



