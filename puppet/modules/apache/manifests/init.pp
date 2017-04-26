class apache {

	package {'apache2':
		ensure => 'installed',
		allowcdrom => 'true',
	}

	service {'apache2':
                ensure => 'running',
                enable => 'true',
                require => Package["apache2"],
        }

	
	package {'php7.0':
		ensure => 'installed',
		allowcdrom => 'true',		
	}
	
	package {'libapache2-mod-php7.0':
		ensure => 'installed',
		allowcdrom => 'true',
	}

	file {'/etc/apache2/mods-available/php7.0.conf':
		content => template('apache/php7.0.conf.erb'),	
	}

	file {'/home/xubuntu/public_html':
		ensure => 'directory',
	}

	file {'/home/xubuntu/public_html/index.php':
		content => '<?php print 2+2 ?>',
	}
	
	exec {'a2enmod': 
		command => '/usr/sbin/a2enmod userdir',
		notify => Service["apache2"],
		require => Package["apache2"],
	}

	file { '/etc/apache2/mods-enabled/userdir.load':
                ensure => 'link',
                target => '/etc/apache2/mods-available/userdir.load',
                notify => Service["apache2"],
                require => Package["apache2"],
        }

        file { '/etc/apache2/mods-enabled/userdir.conf':
                ensure => 'link',
                target => '/etc/apache2/mods-available/userdir.conf',
                notify => Service["apache2"],
                require => Package["apache2"],
        }
	

}


