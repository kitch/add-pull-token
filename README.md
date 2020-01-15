Need to add a pull token/secret to your Red Hat OpenShift on IBM Cloud cluster?

If you head to registry.redhat.io and click on service accounts then you can get a pull token for your account. You will want to go to the Docker Configuration tab and click on "view its contents". you want to grab the `auth` section which is a base64 encoded string with your login. You can then insert your token into this daemonset and apply it to your cluster to add it to your cluster. 

https://github.com/kitch/add-pull-token/blob/master/pull-token-ds.yaml

In addition you will want to add your token for the samples operator. You can get the username and token values from the `Docker Login` tab of the Red Hat registry web site...
```
oc -n openshift-config create secret docker-registry pull-secret --docker-server=registry.redhat.io --docker-username="<registry user>" --docker-password="<token>" --docker-email=<email>
```

![redhat registry](./redhat-registry-token.png)
