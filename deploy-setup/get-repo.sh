printf "\nProvide remote URL:-\n>> "
read ks_url

if [ -f "$HOME/.ssh/id_ecdsa" ]; then
	echo "Note: id_ecdsa ALREADY EXISTS! Type a new filename for the public key or leave blank to use id_ecdsa."
	read ks_make_key
	if [ -z "$ks_make_key" ]; then
		ks_make_key="id"
		ssh-keygen -f "$HOME/.ssh/${ks_make_key}_ecdsa" -t ecdsa -b 521
		ssh-add "$HOME/.ssh/${ks_make_key}_ecdsa"
		cat "$HOME/.ssh/${ks_make_key}_ecdsa.pub"
		echo "\n\nIMPORTANT:\nCopy the above key and add it as a deploy key.\n"
		echo "Press enter to continue..."
		read ks_x
	else
		ssh-keygen -f "$HOME/.ssh/${ks_make_key}_ecdsa" -t ecdsa -b 521
		ssh-add "$HOME/.ssh/${ks_make_key}_ecdsa"
		cat "$HOME/.ssh/${ks_make_key}_ecdsa.pub"
		echo "\n\nIMPORTANT:\nCopy the above key and add it as a deploy key.\n"
		echo "Press enter to continue..."
		read ks_x
	fi
else
	ks_make_key="id"
	ssh-keygen -f "$HOME/.ssh/${ks_make_key}_ecdsa" -t ecdsa -b 521
	ssh-add "$HOME/.ssh/${ks_make_key}_ecdsa"
	cat "$HOME/.ssh/${ks_make_key}_ecdsa.pub"
	echo "\n\nIMPORTANT:\nCopy the above key and add it as a deploy key.\n"
	echo "Press enter to continue..."
	read ks_x
fi

mkdir -p apps
cd apps
git clone $ks_url
