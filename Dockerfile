FROM rundeck/rundeck:4.7.0

# rundeck:4.7.0 image +
#   - plugins
#     - kubernetes
#     - slack notifications
#   - python3
#   - pip3
#     - awscli
#     - boto3 (for aws)
#     - kubernetes

USER root
RUN apt-get update --fix-missing && \
    apt-get install -yq \
      python3 \
      python3-pip && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /apt/lists/*
USER rundeck
RUN pip3 install --user \
      boto3 \
      kubernetes \
      awscli && \
  mkdir -p /home/rundeck/.ssh && touch /home/rundeck/.ssh/known_hosts
# https://github.com/rundeck-plugins
ADD --chown=rundeck:root https://github.com/rundeck-plugins/slack-incoming-webhook-plugin/releases/download/v1.2.5/slack-incoming-webhook-plugin-1.2.5.jar ./libext/
ADD --chown=rundeck:root https://github.com/rundeck-plugins/kubernetes/releases/download/2.0.8/kubernetes-plugin-2.0.8.zip ./libext/
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/rundeck/.local/bin/"
