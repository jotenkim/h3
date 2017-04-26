class apache {

	package {'apache2':
		ensure => 'installed',
		allowcdrom => 'true',
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
	
	service {'apache2':
		ensure => 'running',
		enable => 'true',
		require => Package["apache2"],
	}


}
