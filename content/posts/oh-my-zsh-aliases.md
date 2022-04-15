---
title: "Oh My Zsh Aliases"
date: 2021-09-17T15:54:20-04:00
comments: true
categories: Linux
keywords: zsh, oh-my-zsh, alias, shell, linux
---

| Alias | Command    |
| ----- | ---------- |
| `md`  | `mkdir -p` |

## Plugin aliases

### Git

| Alias     | Command                               |
| --------- | ------------------------------------- |
| `g`       | `git`                                 |
| `ga`      | `git add`                             |
| `gaa`     | `git add --all`                       |
| `gb`      | `git branch`                          |
| `gba`     | `git branch -a`                       |
| `gc`      | `git commit -v`                       |
| `gc!`     | `git commit -v --amend`               |
| `gca`     | `git commit -v -a`                    |
| `gca!`    | `git commit -v -a --amend`            |
| `gcam`    | `git commit -a -m`                    |
| `gcp`     | `git cherry-pick`                     |
| `gcpa`    | `git cherry-pick --abort`             |
| `gcpc`    | `git cherry-pick --continue`          |
| `gd`      | `git diff`                            |
| `gds`     | `git diff --staged`                   |
| `gignore` | `git update-index --assume-unchanged` |
| `gm`      | `git merge`                           |
| `gsw`     | `git switch`                          |
| `gst`     | `git status`                          |
| `gsh`     | `git show`                            |

### VS Code

| Alias  | Command       |
| ------ | ------------- |
| `vsc`  | `code .`      |
| `vscd` | `code --diff` |

### Terraform

| Alias | Command     |
| ----- | ----------- |
| `tf`  | `terraform` |

### Kubectl

| Alias   | Command                            |
| ------- | ---------------------------------- |
| `k`     | `kubectl`                          |
| `kaf`   | `kubectl apply -f`                 |
| `kdel`  | `kubectl delete`                   |
| `kdelf` | `kubectl delete -f`                |
| `kga`   | `kubectl get all`                  |
| `kgaa`  | `kubectl get all --all-namespaces` |
| `kl`    | `kubectl logs`                     |
| `kpf`   | `kubectl port-forward`             |
| `kj`    | `kubectl "$@" -o json \| jq`       |
| `kjx`   | `kubectl "$@" -o json \| fx`       |
| `ky`    | `kubectl "$@" -o yaml \| yh`       |

#### Pods

| Alias     | Command                    |
| --------- | -------------------------- |
| `kgp`     | `kubectl get pods`         |
| `kgpl`    | `kubectl get pods -l`      |
| `kgpn`    | `kubectl get pods -n`      |
| `kgpwide` | `kubectl get pods -o wide` |
| `kep`     | `kubectl edit pods`        |
| `kdp`     | `kubectl describe pods`    |
| `kdelp`   | `kubectl delete pods`      |

#### Services

| Alias     | Command                   |
| --------- | ------------------------- |
| `kgs`     | `kubectl get svc`         |
| `kgswide` | `kubectl get svc -o wide` |
| `kes`     | `kubectl edit svc`        |
| `kds`     | `kubectl describe svc`    |
| `kdels`   | `kubectl delete svc`      |

#### Namespaces

| Alias    | Command                      |
| -------- | ---------------------------- |
| `kgns`   | `kubectl get namespaces`     |
| `kdns`   | `kubectl describe namespace` |
| `kdelns` | `kubectl delete namespace`   |

#### Configmaps

| Alias    | Command                      |
| -------- | ---------------------------- |
| `kgcm`   | `kubectl get configmaps`     |
| `kecm`   | `kubectl edit configmap`     |
| `kdcm`   | `kubectl describe configmap` |
| `kdelcm` | `kubectl delete configmap`   |

#### Secrets

| Alias     | Command                   |
| --------- | ------------------------- |
| `kgsec`   | `kubectl get secret`      |
| `kdsec`   | `kubectl describe secret` |
| `kdelsec` | `kubectl delete secret`   |

#### Deployments

| Alias     | Command                          |
| --------- | -------------------------------- |
| `kgd`     | `kubectl get deployment`         |
| `kgdwide` | `kubectl get deployment -o wide` |
| `ked`     | `kubectl edit deployment`        |
| `kdd`     | `kubectl describe deployment`    |
| `kdeld`   | `kubectl delete deployment`      |
| `ksd`     | `kubectl scale deployment`       |

#### ReplicaSets

| Alias  | Command          |
| ------ | ---------------- |
| `kgrs` | `kubectl get rs` |

#### Nodes

| Alias  | Command                 |
| ------ | ----------------------- |
| `kgno` | `kubectl get nodes`     |
| `kdno` | `kubectl describe node` |

#### PVCs

| Alias     | Command                |
| --------- | ---------------------- |
| `kgpvc`   | `kubectl get pvc`      |
| `kdpvc`   | `kubectl describe pvc` |
| `kdelpvc` | `kubectl delete pvc`   |

#### StatefulSets

| Alias      | Command                           |
| ---------- | --------------------------------- |
| `kgss`     | `kubectl get statefulset`         |
| `kgsswide` | `kubectl get statefulset -o wide` |
| `kess`     | `kubectl edit statefulset`        |
| `kdss`     | `kubectl describe statefulset`    |
| `kdelss`   | `kubectl delete statefulset`      |
| `ksss`     | `kubectl scale statefulset`       |

#### DaemonSets

| Alias    | Command                      |
| -------- | ---------------------------- |
| `kgds`   | `kubectl get daemonset`      |
| `keds`   | `kubectl edit daemonset`     |
| `kdds`   | `kubectl describe daemonset` |
| `kdelds` | `kubectl delete daemonset`   |
