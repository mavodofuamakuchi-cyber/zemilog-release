# Tomcat 10 (Java 17対応) を使用
FROM tomcat:10.1-jdk17

# 初期ファイル削除
RUN rm -rf /usr/local/tomcat/webapps/*

# 作成したWARファイルを配置
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# ポート8080公開
EXPOSE 8080

# Tomcat起動
CMD ["catalina.sh", "run"]