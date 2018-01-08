#!/bin/bash

### Configuration du serveur kerberos.

cat >> /etc/krb5.conf << EOF
[libdefaults]
	default_realm = LE-101.FR
	forwardable = true
        proxiable = true
	dns_lookup_kdc = no
	dns_lookup_realm = no
	allow_weak_crypto = true

[realms]
	LE-101.FR = {
		kdc = kdc1.le-101.fr
		admin_server = kdc1.le-101.fr
		default_domain = le-101.fr
		default_lifetime = 7d
		ticket_lifetime = 7d
	}

[domain_realm]
	.le-101.fr = LE-101.FR
	le-101.fr = LE-101.FR

EOF

### Configuration SSH pour la vogsphere

cat >> /etc/ssh/ssh_config << EOF
Host *.101.fr
     SendEnv LANG LC_*
     StrictHostKeyChecking no
     GSSAPIAuthentication yes
     GSSAPIDelegateCredentials yes
     PasswordAuthentication yes
EOF

echo "Configuration terminée !"
