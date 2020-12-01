# AWS cli, Helm and kubectl

[![](https://images.microbadger.com/badges/image/matshareyourscript/aws-helm-kubectl.svg)](https://microbadger.com/images/matshareyourscript/aws-helm-kubectl)
[![](https://images.microbadger.com/badges/version/matshareyourscript/aws-helm-kubectl.svg)](https://microbadger.com/images/matshareyourscript/aws-helm-kubectl)
[![Build Status](https://travis-ci.org/mat-shareyourscript/aws-helm-kubectl.svg?branch=master)](https://travis-ci.org/mat-shareyourscript/aws-helm-kubectl)
[![Docker Stars](https://img.shields.io/docker/stars/matshareyourscript/aws-helm-kubectl.svg?style=flat)](https://hub.docker.com/r/matshareyourscript/aws-helm-kubectl/)
[![Docker Automated build](https://img.shields.io/docker/automated/matshareyourscript/aws-helm-kubectl.svg?style=flat)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/matshareyourscript/aws-helm-kubectl.svg)]()

## Tags

* [0.0.1](http://github.com/mat-shareyourscript/aws-helm-kubetcl/releases/tag/1.0.0) - aws cli v1.16.193, helm v2.14.1, kubectl v1.15.0, alpine 3.10
* [1.1.0](http://github.com/mat-shareyourscript/aws-helm-kubetcl/releases/tag/1.1.0) - aws cli v1.16.196, helm v2.14.2, kubectl v1.15.0, alpine 3.10
* [1.2.0](http://github.com/mat-shareyourscript/aws-helm-kubetcl/releases/tag/1.2.0) - aws cli v1.16.205, helm v2.14.2, kubectl v1.15.0, alpine 3.10
* [1.3.0](http://github.com/mat-shareyourscript/aws-helm-kubetcl/releases/tag/1.3.0) - aws cli v1.16.283, helm v2.15.2, kubectl v1.16.0, alpine 3.10
* [2.0.0](http://github.com/mat-shareyourscript/aws-helm-kubetcl/releases/tag/2.0.0) - aws cli v1.16.283, helm v3.0.0, kubectl v1.16.3, alpine 3.10
* [2.1.0](http://github.com/mat-shareyourscript/aws-helm-kubetcl/releases/tag/2.1.0) - aws cli v1.17.2, helm v3.0.2, kubectl v1.17.9, alpine 3.10
* [2.1.1](http://github.com/mat-shareyourscript/aws-helm-kubetcl/releases/tag/2.1.0) - aws cli v1.18.117, helm v3.0.2, kubectl v1.17.9, alpine 3.10
* [2.2.0](http://github.com/mat-shareyourscript/aws-helm-kubetcl/releases/tag/2.2.0) - aws cli v1.18.186, helm v3.0.2, kubectl v1.18.6, alpine 3.10

## How to use this image

### Usage

To just run helm on entry:
```
docker run --rm matshareyourscript/aws-helm-kubectl helm
```
By default kubectl will try to use /root/.kube/config file for connection to the kubernetes cluster, but does not exist by default in the image.

For use with personal administration or troubleshooting with volume mount for kubeconfig files:
```
docker run -it -v ~/.kube:/root/.kube matshareyourscript/aws-helm-kubectl
```
The -v maps your host docker machine Kubernetes configuration directory (~/.kube) to the container's Kubernetes configuration directory (root/.kube).

To set AWS environment:
```
docker run --rm -e "AWS_ACCESS_KEY_ID=1234567890" -e "AWS_SECRET_ACCESS_KEY=azertyuiop" -e "AWS_DEFAULT_REGION=eu-west-1" matshareyourscript/aws-helm-kubectl
```

To get ARN certificate (from AWS Certificate Manager) of a given DomainName:
```
docker run --rm -e "AWS_ACCESS_KEY_ID=1234567890" -e "AWS_SECRET_ACCESS_KEY=azertyuiop" -e "AWS_DEFAULT_REGION=eu-west-1" matshareyourscript/aws-helm-kubectl acm _DOMAINNAME_
```


-----------

**Footnotes:**

This is mostly inspired by [https://github.com/dtzar/helm-kubectl](https://github.com/dtzar/helm-kubectl)
