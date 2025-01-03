# holo-munet-topologies
Topologies for developing holo routing with munet


### PATH
expects a path for your holod and holi cli builds locally to use in namespaces
```
HOLO_BUILD_DIR="/path/to/build/directory/holod"
```


Run with
```
tmux
sudo -E munet -c ospf/holo-ospf-topo-2-1/munet.yaml
term rt1
 ```

# todo
- run holod in each router
- write logging for each router to predicatable dir