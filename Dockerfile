FROM alpine:3.10

LABEL org.label-schema.name="aws-helm-kubectl" \
      org.label-schema.url="https://hub.docker.com/r/matshareyourscript/aws-helm-kubectl/" \
      org.label-schema.vcs-url="https://github.com/mat-shareyourscript/aws-helm-kubectl"

# Note: Latest version of kubectl may be found at:
# https://aur.archlinux.org/packages/kubectl-bin/
ENV KUBE_LATEST_VERSION="v1.16.0"
# Note: Latest version of helm may be found at:
# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="v2.15.2"
# Note: Latest version of AWS CLI may be found at:
# https://github.com/aws/aws-cli/
ENV AWS_CLI_VERSION="1.16.283"

COPY ./configure.sh /opt/

COPY ./acm /usr/local/bin/

RUN apk add --no-cache \
      ca-certificates \
      git \
      curl \
      bash \
      python3 \
      python3-dev \
      py3-pip \
      build-base \
    && pip3 install --upgrade --no-cache-dir awscli==${AWS_CLI_VERSION} \
    && pip3 install --upgrade --no-cache-dir boto3 \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && apk --purge del \
         py3-pip \
         build-base \
    && rm -rf /var/cache/apk/* \
    && chmod 755 /usr/local/bin/acm \
    && chmod 755 /opt/configure.sh \
    && /opt/configure.sh

WORKDIR /

CMD ["sh"]
