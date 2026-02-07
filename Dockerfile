# ★絶対に 9.0 (jdk17) を指定する★
FROM tomcat:9.0-jdk17

# 初期ファイルを削除
RUN rm -rf /usr/local/tomcat/webapps/*

# シャットダウンポート無効化（エラーログ対策）
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

# さっき作った WARファイルを配置
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# ポート8080を開放
EXPOSE 8080

# Tomcat起動
CMD ["catalina.sh", "run"]