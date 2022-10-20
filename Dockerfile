FROM rundeck/rundeck:4.7.0

USER root
RUN apt-get update --fix-missing && \
    apt-get install -yq \
      python3 \
      python3-pip && \
    rm -rf /apt/lists/*
USER rundeck
RUN pip3 install --user \
      boto3 \
      awscli && \
  mkdir -p /home/rundeck/.ssh && touch /home/rundeck/.ssh/known_hosts
ADD --chown=rundeck:root https://github.com/rundeck-plugins/slack-incoming-webhook-plugin/releases/download/v1.2.5/slack-incoming-webhook-plugin-1.2.5.jar ./libext/
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/rundeck/.local/bin/"
