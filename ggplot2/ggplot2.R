# ------------------------------------------------------
# ---- Theme: an introduction to ggplot2  --------------
# ---- Author��xiawenjun -------------------------------
# -----Main Packages: ggplot2+GGally -------------------
#------Date:2020-9-19-----------------------------------
# ------------------------------------------------------

# 
# ggplot2 ��R��һ����������ͼ�������м�����Ҫ�����
#   1. ����ͼ�����������
#   2. ����ͼ����ͼ
# 
# ggplot2 �����Ĳ㣺
#   1. ���ݲ�  ggplot()
#   2. ����ͼ�β�  geom_line(), geom_point()
#   3. ��ѧ��  labs(), guides(), theme()
# 
# ӳ��ĸ��
#   aes() �����ݼ��е����ݹ�������Ӧ��ͼ�����Թ�����һ�ֶ�Ӧ��ϵ

# �����Ĳ���/��ʽ
ggplot(data, aes(x = , y = , )) +    # �������� 
  geom_xxx() +                       # ����ͼ��
  geom_xxx() +                       # ���ܻ����Ӷ��ͼ��
  annotate() +                       # ���ӱ�ע 
  labs() +                           # ���������ᡢ���⡢�������
  guides() +                         # �޸�Ĭ��ͼ��
  theme() +                          # ȫ���޸����⣬�������塢����ɫ��
# 

# ����׼��
library(ggplot2)
winedata = read.csv('C:\\Users\\xiawenjun\\Desktop\\����\\Multivariate-statistical-analysis\\ggplot2\\wine_data.csv', head=TRUE)
winedata = winedata[sample(nrow(winedata)), ]
head(winedata)
summary(winedata)


# һ ɢ��ͼ
ggplot(data = winedata, aes(x = fixed.acidity, 
                            y = volatile.acidity)) + 
  geom_point() 
 

# ��θ���ɢ�����ɫ��
ggplot(data = winedata, aes(x = fixed.acidity, 
                            y = volatile.acidity)) + 
  geom_point(aes(color = 'darkblue'))


# �ر�ע�⣡��
# ���������colorд����aes�������Ǵ����
# Reason��ӳ���ϵ��aesӳ�亯���н�color�������ӳ�䵽��darkblue������ַ��������ڸ��ַ���
#         ����ʾ����һ����ɫ��ϵͳ���Զ�Ϊ������һ����ɫ
ggplot(data = winedata, aes(x = fixed.acidity, 
                            y = volatile.acidity)) + 
  geom_point(size = 1.5, color = 'darkblue')


# ������η�����ɢ��ͼ��
# ��ɫ����С����״��͸���ȵ�
# ��Ȼ����ӳ���ϵ
ggplot(data = winedata, aes(x = fixed.acidity, 
                            y = volatile.acidity)) + 
  geom_point(size = 3, aes(color = type))  


ggplot(data = winedata, aes(x = fixed.acidity, 
                            y = volatile.acidity)) + 
  geom_point(size = 3, aes(color = type, shape = type))


# ����޸�Ĭ�Ϸ������ɫ��
ggplot(data = winedata, aes(x = fixed.acidity, 
                            y = volatile.acidity)) + 
  geom_point(size = 3, aes(color = type, shape = type)) + 
  scale_color_manual(values = c("#E69F00", "#999999")) + 
  scale_shape_manual(values = c(15, 19)) 
# ���Ҫ����ı����������ģ�Ӧ������ scale_color_gradient(low="",high ="")



# ����������ͱ���
ggplot(data = winedata, aes(x = fixed.acidity, 
                            y = volatile.acidity)) + 
  geom_point(size = 3, aes(color = type, shape = type)) + 
  scale_color_manual(values = c("#E69F00", "#999999")) + 
  scale_shape_manual(values = c(15, 19)) + 
  labs(x = 'concentration of fixed.acidity', 
       y = 'concentration of violatile.acidity', 
       title = 'scatter plot of fixed.acidity and violatile.acidity by type')


ggplot(data = winedata, aes(x = fixed.acidity, 
                            y = volatile.acidity)) + 
  geom_point(size = 3, aes(color = type, shape = type)) + 
  scale_color_manual(values = c("#E69F00", "#999999"), labels=c("red wine", "white wine")) + 
  scale_shape_manual(values = c(15, 19), labels=c("red wine", "white wine")) + 
  labs(x = 'concentration of fixed.acidity', 
       y = 'concentration of violatile.acidity', 
       title = 'scatter plot of fixed.acidity and violatile.acidity by type') + 
  theme(
    # title����
    plot.title = element_text(hjust = 0.5, family="mono", face = 'bold'),
    # �������ǩ������
    axis.title.x = element_text(size = 15), 
    axis.title.y = element_text(size = 15), 
    # ������̶�������Ӵ�
    axis.text.x = element_text(size = 12, face = 'bold'), 
    axis.text.y = element_text(size = 12, face = 'bold'), 
    # ͼ�������С
    legend.text = element_text(size=12), 
    # ͼ������
    legend.title = element_blank(), 
    # ͼ��λ��
    legend.position = 'top',
    panel.background = element_rect(colour = "black", size = 2), 
)


# ���ӱ�ʶ
ggplot(data = winedata, aes(x = fixed.acidity, 
                            y = volatile.acidity)) + 
  geom_point(size = 3, aes(color = type, shape = type)) + 
  scale_color_manual(values = c("#E69F00", "#999999"), labels=c("red wine", "white wine")) + 
  scale_shape_manual(values = c(15, 19), labels=c("red wine", "white wine")) + 
  labs(x = 'concentration of fixed.acidity', 
       y = 'concentration of violatile.acidity', 
       title = 'scatter plot of fixed.acidity and violatile.acidity by type') + 
  theme(
    # title����
    plot.title = element_text(hjust = 0.5, family="mono", face = 'bold'),
    # �������ǩ������
    axis.title.x = element_text(size = 15), 
    axis.title.y = element_text(size = 15), 
    # ������̶�������Ӵ�
    axis.text.x = element_text(size = 12, face = 'bold'), 
    axis.text.y = element_text(size = 12, face = 'bold'), 
    # ͼ�������С
    legend.text=element_text(size=12), 
    # ͼ������
    legend.title=element_blank(), 
    # ͼ��λ��
    legend.position = 'top',
    panel.background = element_rect(colour = "black", size = 2), 
  ) + 
  annotate(geom = 'rect',             # ��������
           xmin = 6, xmax =10,        # 
           ymin = 1.2, ymax = 1.6,    # ���귶Χ
           fill = 'red', alpha = 0.2) + # ���Ϊ��ɫ��͸����Ϊ0.2
  # ���Ӽ�ͷ����������annotate�����Ӽ�ͷ�����򲻺ÿ���
  geom_segment(aes(x = 12, y = 1.4, xend = 10, yend = 1.3),
               size = 1, 
               arrow = arrow(angle = 20, length = unit(4, "mm"))) + 
  # ��������
  annotate(geom = 'text', 
           x = 13.5, y = 1.4, size = 5, 
           label = 'low fixed.acidity but \n high violatile.acidity')


# �� ֱ��ͼ
ggplot(data = winedata, 
       aes(x = volatile.acidity)) + 
  geom_histogram(bins = 50, alpha = 0.6, fill = 'steelblue', colour = 'black')



ggplot(data = winedata, 
       aes(x = volatile.acidity)) + 
  geom_histogram(bins = 50, alpha = 0.6, fill = 'steelblue', colour = 'black') + 
  geom_density(color = 'red', size = 1.5)

# �ܶȺ����ķ�Χ��y��ķ�ΧС, ��һ��ͼ����ʾ������
# ��Ҫ��mapӳ��һ�� ��y�ĳ߶�ӳ�䵽density�ĳ߶�

ggplot(data = winedata, 
       aes(x = volatile.acidity)) + 
  geom_histogram(bins = 50, 
                 mapping = aes(y = ..density..), 
                 alpha = 0.6, fill = 'steelblue', colour = 'black')+
  geom_line(stat = 'density', size = 1.1, color = 'red')















# �� ��ͼ

# �¹�����
# ���ذ�װ�� https://api.github.com/repos/GuangchuangYu/nCov2019/tarball/HEAD
# cmd����R��װ·���µ�bin/x64 �ļ���
# ���� Rcmd.exe INSTALL C:\Users\xiawenjun\Downloads\nCov2019-218c30f.tar.gz

library(nCov2019)
library(maptools)
library(dplyr)
library(ggplot2)
# --------------------------------
library(lubridate)

x = load_nCov2019()
data_province = summary(x)
data_province = data.frame(time = data_province$time,  
                           NAME = data_province$province, 
                           cum_confirm = data_province$cum_confirm)
head(data_province)
tail(data_province)
# �����ݷֳɼ���
data_province$Group = cut(data_province$cum_confirm, 
                          breaks=  c(0,1,10,50,100,500,1000,5000,100000), 
                          labels = c("0","1-9","10-49","50-99","100-499","500-999","1000-4999",">=5000"), 
                          order = TRUE,
                          include.lowest = TRUE, 
                          right = TRUE) 
head(data_province)

# ymd ���ַ�������Ϊʱ��
startTime = ymd("2019-12-01")
nowTime = Sys.time()
endTime = date(nowTime) - ddays(2)
timeLength = interval(startTime, endTime) %>% time_length("day")
mytime = startTime + ddays(0:timeLength)
mytime

# ��ͼ
setwd('C:\\Users\\xiawenjun\\Desktop\\����\\Multivariate-statistical-analysis\\ggplot2\\china_basic_map')
china_map = readShapePoly("bou2_4p.shp")

# ������ͼ�������
x1 = china_map@data          
xs = data.frame(x1, id=seq(0:923)-1)
# ��������Ϣ�ļ�ת��Ϊdata.frame��ʽ����
china_map1 = fortify(china_map) 
china_map1$id = as.integer(china_map1$id)
china_map_data = full_join(china_map1, xs)  
head(china_map_data)

# map�е�ʡ������data_province�е�ʡ������һ�����޸�һ��ʹ��һһ��Ӧ
# mutate ����һ��
china_map_data = china_map_data %>%
  mutate(NAME = substr(NAME, 1, 2))
china_map_data[which(china_map_data$NAME == '����'), ]$NAME = '������'
china_map_data[which(china_map_data$NAME == '����'), ]$NAME = '���ɹ�'
head(china_map_data)
head(data_province)

# ��map������data_province������������
# ȫ���ӷ�������sql�﷨
china_data = full_join(china_map_data, data_province) 
head(china_data)
# ɾ������Ҫ����
china_data = china_data[ , -which(colnames(china_data) 
                                  %in% c('order', 'hole', 'piece', 'AREA', 'PERIMETER', 
                                         'BOU2_4M_', 'BOU2_4M_ID', 'ADCODE93', 'ADCODE99' ))]
head(china_data)

covid_plot = function(china_data, daytime){
  
  # ѡ���ض�ʱ�ڵ�����
  df = subset(china_data, time == daytime)
  
  # �޸�
  # df = df_prepare(china_map_data, df)
  
  # ��group���
  p = ggplot(data = df, aes(x = long, y = lat, 
                            group = group, fill = Group)) + 
    geom_polygon(colour = 'Black') + 
    coord_map('polyconic') + 
    scale_fill_brewer(palette = 'OrRd') + 
    # scale_color_manual(values = c("#E69F00", "#999999", 'red')) + 
    labs(title = '�¹������ۼ�ȷ��', 
         subtitle = daytime, 
         x = '', 
         y = '') + 
    theme(
      plot.title = element_text(face = "bold", hjust = 0.5),
      plot.subtitle = element_text(face = "bold", hjust = 0.5, size = 15, color = "red"),
      legend.title = element_text(face = 'bold'), 
      legend.text = element_text(face = "bold",color = "black"),
      legend.background = element_rect(colour = "black"),
      legend.key = element_rect(fill = NA),
      legend.position = 'right',
      panel.border = element_rect(color = "black", linetype = "solid", size = 1, fill = NA) 
    ) + 
    guides(fill=guide_legend(title='�ۼ�ȷ����'))
  
  # ����ͼƬ
  ggsave(filename = paste(sep = '', daytime, '.png'), 
         plot = p, 
         path = 'C:\\Users\\xiawenjun\\Desktop\\����\\\\Multivariate-statistical-analysis\\ggplot2\\covid', 
         width = 20, height = 20, units = 'cm')
}





for (i in seq(1, length(mytime), 3)) {
  daytime = mytime[i]
  covid_plot(china_data, daytime)
}

# ��̬��Ⱦ

# �ȶ�ȡ�ļ��������е�ͼƬ
setwd('C:\\Users\\xiawenjun\\Desktop\\����\\Multivariate-statistical-analysis\\ggplot2\\covid_now')
# ��ȡ�ļ���
filename = list.files(pattern="*.png")

library(magick)
library(gganimate)
animate_p = image_animate(image = image_read(
  path = filename))
# ����gif
anim_save(filename = "�ִ�ȷ��.gif",animation = animate_p)

# ---------------------------------

# -------------------------------------------------------------------------
# -------------------------------------------------------------------------
# -------------------------------------------------------------------------
# Question ----
# ˼������������û��ʲô���⣿
#---- ������subset����ֻ����ȡ���������ĵ���������������ĵ���������ͼ��չʾ����
#������ͼ����2019.12.1�ſ�ʼ��ͼ����Է��ִ�����
#------------------------
#-----��ν����---------

#---��������
#��ÿ��ʱ���ÿ�����������ݲ�����������������Ϊ0��ҲҪ�������м���
#������̲��ѣ����ǿ�����������ݻ�ܴ�ͬѧ�ǿ������ԡ�
#ͬ��Ҳ���Գ�����������ʡ�ݵ�ͼ��������ͼ


# ���и�bug 2020-09-08 2020-09-17 û������


add_zero_province = function(china_map_data, df, provincename){
  df_new = china_map_data[which(china_map_data$NAME == provincename), ]
  # ֻѡ�����õ���
  df_new = df_new[, which(colnames(df_new) %in% c('long', 'lat', 'id', 'group', 'NAME'))]
  # ����ʱ����
  n = nrow(df_new)
  daytime = df$time[1]
  df_new$time = rep(daytime, n)
  # ����������
  df_new$data_name = rep(0, n)
  names(df_new)[ncol(df_new)] = names(df)[7]
  # ����Group��
  df_new$Group = rep('0', n)
  
  head(df_new)
  return (rbind(df, df_new))
}


add_not_exist_province = function(china_map_data, df){
  total_province = data.frame(table(china_map_data$NAME))[, 1]
  total_province = as.character(total_province)
  exist_province = data.frame(table(df$NAME))[, 1]
  exist_province = as.character(exist_province)
  
  not_exist = total_province %in% exist_province
  not_exist_province = total_province[not_exist == FALSE]
  
  for (provincename in not_exist_province) {
    df = add_zero_province(china_map_data, df, provincename)
  }
  return(df)
}

add_point_for_legend = function(df){
  # һ�ַǳ��޴��Ľ������....
  # ����ͬ�߶ȵĵ㶼����һ��
  sample_data = sample(1:nrow(df))
  df[sample_data[1], 8] = '0'
  df[sample_data[2], 8] = '1-9'
  df[sample_data[3], 8] = "10-49"
  df[sample_data[4], 8] = "50-99"
  df[sample_data[5], 8] = "100-499"
  df[sample_data[6], 8] = "500-999" 
  df[sample_data[7], 8] = "1000-4999"
  df[sample_data[8], 8] = ">=5000"   
  return(df)
}

df_prepare = function(china_map_data, df){
  df = add_not_exist_province(china_map_data, df)
  df = add_point_for_legend(df)
  return(df)
}


## ��Ҫ�ο� https://zhuanlan.zhihu.com/p/115480483
