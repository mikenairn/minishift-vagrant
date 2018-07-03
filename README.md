
```
$ minishift version
minishift v1.20.0+53c500a

$ virtualbox --help
Oracle VM VirtualBox Manager 5.2.8
...

$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'centos/7'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'centos/7' is up to date...
==> default: Setting the name of the VM: minishift-vagrant_default_1530622936506_15000
==> default: Clearing any previously set network interfaces...
==> default: Available bridged network interfaces:
1) enp0s25
2) wlp3s0
3) virbr1
4) docker0
5) virbr0
==> default: When choosing an interface, it is usually the one that is
==> default: being used to connect to the internet.
    default: Which interface should the network bridge to? 1
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: bridged
==> default: Forwarding ports...
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default:
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default:
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
    default: No guest additions were detected on the base box for this VM! Guest
    default: additions are required for forwarded ports, shared folders, host only
    default: networking, and more. If SSH fails on this machine, please install
    default: the guest additions and repackage the box to continue.
    default:
    default: This is not an error message; everything may continue to work properly,
    default: in which case you may ignore this message.
==> default: Configuring and enabling network interfaces...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
==> default: Rsyncing folder: /home/mnairn/src/fheng/minishift-vagrant/ => /vagrant
==> default: Running provisioner: shell...
    default: Running: /tmp/vagrant-shell20180703-8554-w4q6rb.sh
    default: Loaded plugins: fastestmirror
    default: Determining fastest mirrors
.....

$ vagrant ssh -c ifconfig | grep eth1 -A 5 | grep inet
Connection to 127.0.0.1 closed.
        inet 192.168.8.95  netmask 255.255.252.0  broadcast 192.168.11.255
        inet6 fe80::a00:27ff:fe8d:4e51  prefixlen 64  scopeid 0x20<link>

$ vagrant ssh-config | grep IdentityFile
  IdentityFile /home/mnairn/src/fheng/minishift-vagrant/.vagrant/machines/default/virtualbox/private_key


$ export MINISHIFT_ENABLE_EXPERIMENTAL=y
$ minishift addons disable minishift-mobilecore-addon
$ minishift delete
$ rm -rf ~/.minishift/machines
$ minishift start --vm-driver generic --remote-ipaddress 192.168.8.95 --remote-ssh-user vagrant --remote-ssh-key /home/mnairn/src/fheng/minishift-vagrant/.vagrant/machines/default/virtualbox/private_key
-- Starting profile 'minishift'
-- Checking if provided oc flags are supported ... OK
-- Starting local OpenShift cluster using 'generic' hypervisor ...
..... OK
   Importing 'openshift/origin:v3.9.0' ........... OK
   Importing 'openshift/origin-docker-registry:v3.9.0' ... OK
   Importing 'openshift/origin-haproxy-router:v3.9.0' .. OK
-- OpenShift cluster will be configured with ...
   Version: v3.9.0
-- Copying oc binary from the OpenShift container image to VM .. OK
-- Starting OpenShift cluster .............................................
Using nsenter mounter for OpenShift volumes
Using public hostname IP 192.168.8.95 as the host IP
Using 192.168.8.95 as the server IP
Starting OpenShift using openshift/origin:v3.9.0 ...
OpenShift server started.

The server is accessible via web console at:
    https://192.168.8.95:8443

You are logged in as:
    User:     developer
    Password: <any value>

To login as administrator:
    oc login -u system:admin


$ oc login -u system:admin
$ oc adm policy add-cluster-role-to-user cluster-admin developer
$ oc login -u developer -p any
$ minishift console
Opening the OpenShift Web console in the default browser...
Created new window in existing browser session.

```
