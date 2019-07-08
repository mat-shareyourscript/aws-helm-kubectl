# AWS cli, Helm and kubectl Dockerhub image

[![](https://images.microbadger.com/badges/image/matshareyourscript/aws-helm-kubectl.svg)](https://microbadger.com/images/matshareyourscript/aws-helm-kubectl "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/matshareyourscript/aws-helm-kubectl.svg)](https://microbadger.com/images/matshareyourscript/aws-helm-kubectl "Get your own version badge on microbadger.com")
[![Build Status](https://travis-ci.org/mat-shareyourscript/aws-helm-kubectl.svg?branch=master)](https://travis-ci.org/mat-shareyourscript/aws-helm-kubectl)
[![Docker Stars](https://img.shields.io/docker/stars/matshareyourscript/aws-helm-kubectl.svg?style=flat)](https://hub.docker.com/r/matshareyourscript/aws-helm-kubectl/)
[![Docker Automated build](https://img.shields.io/docker/automated/matshareyourscript/aws-helm-kubectl.svg?style=flat)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/matshareyourscript/aws-helm-kubectl.svg)]()

Tags

* [1.0.0](http://github.com/mat-shareyourscript/aws-helm-kubetcl/releases/tag/1.0.0) - aws cli v1.16.193, helm v2.14.1, kubectl v1.15.0, alpine 3.10

## Run

Example to just run helm on entry:
```
docker run --rm matshareyourscript/aws-helm-kubectl helm
```
By default kubectl will try to use /root/.kube/config file for connection to the kubernetes cluster, but does not exist by default in the image.

Example for use with personal administration or troubleshooting with volume mount for kubeconfig files:
```
docker run -it -v ~/.kube:/root/.kube matshareyourscript/aws-helm-kubectl
```
The -v maps your host docker machine Kubernetes configuration directory (~/.kube) to the container's Kubernetes configuration directory (root/.kube).

Example to set AWS environment:
```
docker run --rm -e "AWS_ACCESS_KEY_ID=1234567890" -e "AWS_SECRET_ACCESS_KEY=azertyuiop" -e "AWS_DEFAULT_REGION=eu-west-1" matshareyourscript/aws-helm-kubectl
```



-----------

**Footnotes:**

This is mostly inspired by [https://github.com/dtzar/helm-kubectl](https://github.com/dtzar/helm-kubectl)
