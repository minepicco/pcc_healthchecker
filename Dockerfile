From ubuntu:18.04
ENV CHANNEL="nohara-demo"
ENV ICON=":dog:"
ENV NAME="Messenger"
ENV TEXT="This_is_a_test_message!"
ENV PCC_URL="https://asia-northeast1.cloud.twistlock.com/"
ENV WH_URL="https://hooks.slack.com/services/"
ENV ITV=300
ENV BOT="xoxp-"

COPY pcc_healthchecker.sh /
RUN chmod +x pcc_healthchecker.sh
RUN apt update && apt install -y curl 

ENTRYPOINT ["./pcc_healthchecker.sh"]
