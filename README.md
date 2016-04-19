SSH-Config
==========

Ansible role to configure user-specific ssh client config file.

> **WARNING:**
> 
>    Ansible will interprete unquoted "yes|no" values as "True|False" respectively
>    So It is recommended to quote the value of each ssh config setting. See 
>    example below.


## Examples

The `ssh_configs` variable takes a list of ssh host config dicts. Keys of a
config dict object are same as that of valid ssh settings. See example below.

```
- hosts: myhost

  vars:
    ssh_config_user:  ogonna
    ssh_config_default:
      StrictHostKeyChecking:  "no"
      UserKnownHostsFile:     "/dev/null"
    ssh_configs:
      - name:         "DEV - Example LTD"
        Host:         "bastion.dev"
        Hostname:     "bastion.dev.example.com"
        ForwardAgent: "yes"
        User:         "ubuntu"
      - Host:         "*.dev.local"
        ProxyCommand: "ssh bastion.dev nc %h %p"
        IdentityFile: "~/.ssh/example.pem"
        User:         "ubuntu"

  roles:
    - wunzeco.ssh-config
```


## Testing

Run `kitchen test` command to test this repo


## Dependencies:

None
