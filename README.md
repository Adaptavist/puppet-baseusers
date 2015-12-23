# BaseUsers Module

## Overview

The **BaseUsers** module provisions machines with a set of local accounts configurable via Hiera.


## Configuration

This module is configured via Hiera.

User entries are stored in a hash referenced by the hiera key `users`. The keys of the `users` hash are the usernames. The values of the `users` hash are the properties of each user.

The possible properties of each user are the same as those for the standard puppet `User` resource [^1].

	users :
	  hosting :
	    name : 'hosting'
	    home : '/home/hosting'
	    shell : '/bin/bash'
	    uid  : '1010'
	    gid  : '1010'
	    comment : 'Hosting User'
	    password : '*'
	    
In the example above a user called `hosting` is configured with home directory `/home/hosting`, default shell `/bin/bash`, user id `1010`, group id `1010` and comment (which typically corresponds to GECOS full user name) of `Hosting User`. The example user  
	    
Group objects are represented as the values of a hash referenced by the hiera key `groups`. The keys of this hash are the group names. The values of the hash are a hash containing the attributes of each group.

The valid attributes for a group are the same as those for a standard `Group` resource [^2].
	
	groups :
	  admin :
	    name : 'admin'
	    gid  : '109'
	
	  hosting :
	    gid : '1010'
	    name : 'hosting'
	    
In the above example two groups are configured. These are `admin` and `hosting` with group ids `109` and `1010` respectively.

## Dependencies

This module has no dependencies on other puppet modules. 

## References

[^1]: http://docs.puppetlabs.com/references/latest/type.html#user 

[^2]: http://docs.puppetlabs.com/references/latest/type.html#group