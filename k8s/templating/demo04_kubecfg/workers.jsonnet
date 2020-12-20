local kube = import "https://raw.githubusercontent.com/bitnami-labs/kube-libsonnet/master/kube.libsonnet";

local workers(name) = {

  service: kube.Service(name) {
    target_pod:: $.deployment.spec.template,
    spec+: {
      type: "NodePort",
    },
  },

  deployment: kube.Deployment(name) {
    spec+: {
      template+: {
        spec+: {
          initContainers_: {
            prepare: kube.Container("prepare") {
              image: "busybox",
              volumeMounts: [{
                name: "app",
                mountPath: "/app",
              }],
            },
          },
          containers_: {
            worker: kube.Container("worker") {
              ports: [{
                name: "app",
                containerPort: 8000
              }],
              image: "python:3.7.4-alpine3.10",
              command: ['sh', '-c', 'python3 -m http.server 8000 --directory app'],
              volumeMounts: [{
                name: "app",
                mountPath: "/app",
              }],
            },
          },
          volumes: [{
            name: "app",
            emptyDir: {},
          }],
        },
      },
    },
  },
};

{
  worker01: workers("worker01") {
    deployment+: {
      spec+: {
        template+: {
          spec+: {
            initContainers_+: {
              prepare+: {
                command: ['sh', '-c', 'echo "<h1> I am worker01 </h1>" > app/index.html']
              },
            },
          },
        },
      },
    },
  },
}
