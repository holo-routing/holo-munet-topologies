# holo-munet-topologies
Topologies for developing holo routing with munet


### PATH
Munet expects `holod` and `holo-cli` to be available so making a symlink to your build objects is recommended.
```
ln -s ~/.cargo/bin/holod /usr/sbin/holod
ln -s ~/.cargo/bin/holo-cli /usr/sbin/holo-cli
```


Run with
```
tmux
sudo -E munet -c ospf/holo-ospf-topo-2-1/munet.yaml
term rt1
 ```

Open a holo-cli for a given router with
```
munet> holo-cli rt1
```

logs for each one of your routers can be examined with
```
cat /tmp/munet/rt1/var.log/holod.log
```

additionaly you can create a symlink in your dev envionment for quick access.
```
ln -s /tmp/munet/rt1/var.log/holod.log ~/dev/env/holo/logs/rt1.log
```