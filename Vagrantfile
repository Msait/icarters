Vagrant.configure(2) do |config|

	config.vm.box = "ubuntu/vivid64"
	config.vm.network "forwarded_port", guest: 9090, host: 9090
	config.vm.network "forwarded_port", guest: 8080, host: 8081	# for local development
	config.vm.network "forwarded_port", guest: 8888, host: 8888 # for testing
	config.vm.network "forwarded_port", guest: 5432, host: 5432 # for postgres
	config.vm.network "forwarded_port", guest: 55555, host: 55555 # jenkins port

	config.vm.synced_folder ".", "/vagrant/home"
	config.ssh.insert_key = false

	config.vm.provision "docker" do |d|
	    # d.run "jenkins", args: "-v '/vagrant/home/provision/jenkins:/var/jenkins_home' -p 8080:9090"
	    # d.build_image "/vagrant/home/provision/jenkins", args: "-t 'bondar/jenkins'"
	    d.build_image "/vagrant/home/provision/tomcat", args: "-t 'bondar/tomcat'"

	    d.pull_images "postgres"
	end
	
	config.vm.provider "virtualbox" do |v|
	  v.memory = 1024
	  v.cpus = 2
	end


	config.vm.provision "shell", path: "script.sh", privileged: true

end