# holo-munet-topologies
Topologies for developing holo routing with [munet](https://github.com/LabNConsulting/munet/)


### PATH
Munet expects `holod` and `holo-cli` to be available so making a symlink to your build objects is recommended.
```
ln -s ~/.cargo/bin/holod /usr/sbin/holod
ln -s ~/.cargo/bin/holo-cli /usr/sbin/holo-cli
```

### Downloading and installing munet
Download the topologies repository:
```sh
git clone https://github.com/holo-routing/holo-munet-topologies/
cd holo-munet-topologies
```

Install munet:
```sh
python3 -m venv venv
source venv/bin/activate
```

### Running a topology
We are going to run the ospf topology, whose topo file is contained in `ospf/holo-ospf-topo-2-1/munet.yaml`. Remember to run this with your virtual environment activated.

Run with:
```sh
tmux
sudo -E munet -c ospf/holo-ospf-topo-2-1/munet.yaml
```

You should be inside munet's CLI. Open a holo-cli for a given router with
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
