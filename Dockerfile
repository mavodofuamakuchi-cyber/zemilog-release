# Tomcat 10 (Java 17対応) を使用
FROM tomcat:10.1-jdk17

# 初期ファイル削除
RUN rm -rf /usr/local/tomcat/webapps/*

# シャットダウンポートを無効化する（sedコマンドで server.xml を書き換える）
RUN sed -i 's/port="8005"/port="-1"/' /usr/local/tomcat/conf/server.xml

# 作成したWARファイルを配置
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# ポート8080公開
EXPOSE 8080

# Tomcat起動
CMD ["catalina.sh", "run"]