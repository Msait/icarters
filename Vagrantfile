Vagrant.configure(2) do |config|

	config.vm.box = "ubuntu/vivid64"
	config.vm.network "forwarded_port", guest: 9090, host: 9090
	config.vm.network "forwarded_port", guest: 8080, host: 8080
	config.vm.synced_folder ".", "/vagrant/home"
	config.ssh.insert_key = false

	config.vm.provision "docker" do |d|
	    d.run "jenkins", args: "-v '/vagrant/home/provision/jenkins:/var/jenkins_home' -p 8080:9090"
	end

end