Vagrant.configure("2") do |config|
  # boxname
  config.vm.box = "ubuntu/trusty64"
  # hostname
  config.vm.hostname = "booklyamedia"

  # update box
  config.vm.box_check_update = true
  
  # web
  config.vm.network "forwarded_port", guest: 80, host: 8080
  # webmin
  config.vm.network "forwarded_port", guest: 10000, host: 10001

  # laravel path
  config.vm.synced_folder "/var/www/laravel/blog", "/var/www/laravel/blog"

  config.vm.provision "ansible" do |ansible|
    ansible.limit = 'all'
    ansible.verbose = 'vvvv'
    ansible.inventory_path = 'inventory'
    ansible.extra_vars = { ansible_ssh_user: 'vagrant' }
    ansible.raw_ssh_args= ["-o ControlMaster=no"]
    ansible.playbook = "provisions/playbook.yml"
  end

  # For VirtualBox
  config.vm.provider "virtualbox" do |vb|
    # VM GUI
    vb.gui = false
  
    # RAM
    vb.memory = "4096"
  end
end
