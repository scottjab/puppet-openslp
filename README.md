Puppet openSLP module
=====================

Introduction
____________

This is a basic module for Suse to manage [openSLP](http://openslp.org)

OS Support:
* SuSE family - Tested,

Pull Requests are welcome for more OS support.

Examples
--------
	
	#basic client 
	class {'openslp':
		scope => 'PUPPET_SCOPE',
		da_addresses => ['slp1.example.com', 'slp2.example.com'],
	}

	#A basic DA

	class {'openslp':
		scope => 'PUPPET_SCOPE',
		da_addresses => [$::fqdn, 'slp2.example.com'],
		is_da => true,
		da_sync => true,
		da_backup => true,
	}

Notes
-----
* Only tested on SLES 11.2 and OES 11.2

TODO
----
* Support for RHEL based distros
* Expose more of the tuning options to puppet

Copyright
_________

Copyright (C) 2012 University of Dayton