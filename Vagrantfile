class ConfigHelper
  DEFAULT_IP="192.168.10.10"
  DEFAULT_MEMORY="2048"
  BOX_URL="https://oss-binaries.phusionpassenger.com/vagrant/boxes/ubuntu-12.04.3-amd64-vbox.box"

  def memory
    (defined?(ENV["MEM"])).nil? ? ENV["MEM"] : DEFAULT_MEMORY
  end

  def ip
    ip = (defined?(ENV["IP"])) ? ENV["IP"] : DEFAULT_IP
  end

  def shared_dirs(&b)
    Dir.foreach(parent_dir) do |item|
      next if file_blacklist.include?(item) || File.directory?(item)
      b.call(item)
    end
  end

  private

  def file_blacklist
    ['.', '..', File.basename(Dir.pwd)]
  end

  def parent_dir
    File.expand_path("..", Dir.pwd)
  end
end

config_helper = ConfigHelper.new

Vagrant.configure("2") do |config|
  config.vm.box = "precise64-docker"
  config.vm.box_url = ConfigHelper::BOX_URL

  config.vm.network :private_network, ip: config_helper.ip
  config.ssh.forward_agent = true
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :shell, :path => "recipes/tmux.sh"
  config.vm.provision :shell, :path => "recipes/dotfiles.sh", :privileged => false

  config_helper.shared_dirs do |dir|
    config.vm.synced_folder "./../#{ dir }", "/#{ dir }", nfs: true
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", config_helper.memory]
  end
end
