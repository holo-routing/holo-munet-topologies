# VRRP topos

Divided into three:

| Topo Name | Topo Details |
| --- | --- |
| vrrpv2-topo-1-1 | VRRP V2, IPV4 topo |
| vrrpv3-topo-1-1 | VRRP V3, IPV6 topo |
| vrrpv3-topo-1-2 | VRRP V3, IPV4 topo |

## Note for conformance testing

For the users that are writing conformance tests and thus generating the config and events json files, make sure to populate the env.txt file with the following:

```
SNAPSHOT_DIR=/holo/proj/dir
```

Replace `/holo/proj/dir` with the path to your holo project's directory.
