# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "thinktainer/centos-6_6-orajdk7-puppet"
  config.vm.box_url = "https://atlas.hashicorp.com/thinktainer/boxes/centos-6_6-orajdk7-puppet"

  config.vm.define :docker do |docker| 
    docker.vm.hostname = "one.cluster"
    docker.vm.network :private_network, ip: "192.168.0.101"
    docker.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 2048]
    end
    config.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"] = "4096"
      v.vmx["numvcpus"] = "1"
    end

    docker.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifest"
      puppet.module_path = "modules"
      puppet.manifest_file = "one.pp"
#      puppet.options = "--verbose --debug"
    end
  end
end
