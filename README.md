# terraform_custom_plugin

What is this repo about:
Sample usage of terraform custom provider in Ubuntu Linux (Xenial). 
Custom plugin that will be used: [terraform-provider-extip](https://github.com/petems/terraform-provider-extip)

# Prerequisites: 

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html)


## How to use this repository: 

1. Clone this repo: 

```
git clone https://github.com/firedot/terraform_custom_plugin.git
```

2. Go in the cloned repo dir: 

```
cd terraform_custom_plugin
```

3. Run the following command: 

```
vagrant up
```

4. Connect to the virtual machine: 

```
vagrant ssh
```

### Preparing the provider

1. Login to the machine: 

```
vagrant ssh
```

2. Elevate priviledges: 

```
sudo su -
```
3. Run the following command: 

```
go get github.com/petems/terraform-provider-extip
```

4. Build the custom plugin
```
cd go/src/github.com/petems/terraform-provider-extip/
make build
```
5. Run the following command: 

```
#This command will create the directory from which terraform will use our custom plugin

mkdir -p /vagrant/terraform.d/plugins/linux_amd64
```

6. Copy the plugin binary to the terraform plugin directory: 

``` 
cp ~/go/bin/terraform-provider-extip /vagrant/terraform.d/plugins/linux_amd64/
```
7. Go in the directory where the terraform configuration file and plugin directories are: 

```
cd /vagrant/
```
8. Run the following command to download all providers implemented in the terraform configuration: 

```
terraform init
```

9. Test if the providers are working by running the following command:

```
terraform apply
```
