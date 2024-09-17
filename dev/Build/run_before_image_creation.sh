#!/bin/bash

# checking if this PC has a swap
if free | awk '/^Swap:/ {exit !$2}'; then
    echo "Have swap"
else
    echo "No swap, creating one"
    fallocate -l 1G /swapfile
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile
    sudo cp /etc/fstab /etc/fstab.bak
    echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
fi

# how 2 remove swap file:
# swapoff /swapfile
# rm /swapfile

rm -rf addons
rm -rf l10n_it*
mkdir addons/

rm -rf l10n-italy
git clone -b 12.0 https://github.com/OCA/l10n-italy.git
echo "Merge https://github.com/OCA/l10n-italy.git to addonns/"
# jan 08 2019 commit cd37d1c3bd85dd9fa28bca29061de428f79abab4
# Commit before invoice sequence change on May 31st > 31e23cf74fad99a90b82c909fcb7ed51ae19d9d6
(echo "Checkout to commit" && cd l10n-italy && git checkout 31e23cf74fad99a90b82c909fcb7ed51ae19d9d6)
echo "Merge https://github.com/OCA/l10n-italy.git to addonns/"
(cd l10n-italy && tar c .) | (cd addons && tar xf -)
#mv l10n-italy/l10n_it_* ./addons
rm -rf l10n-italy

rm -rf partner-contact
git clone -b 12.0 https://github.com/OCA/partner-contact.git
(cd partner-contact && tar c .) | (cd addons && tar xf -)
#mv partner-contact/* ./addons/
echo "Merge https://github.com/OCA/partner-contact.git to addonns/"
rm -rf partner-contact

rm -rf account-financial-tools
git clone -b 12.0 https://github.com/OCA/account-financial-tools.git
(cd account-financial-tools && tar c .) | (cd addons && tar xf -)
#mv account-financial-tools/* ./addons/
echo "Merge https://github.com/OCA/account-financial-tools.git to addonns/"
rm -rf account-financial-tools

rm -rf account-financial-reporting
git clone -b 12.0 https://github.com/OCA/account-financial-reporting.git
(cd account-financial-reporting && tar c .) | (cd addons && tar xf -)
#mv account-financial-reporting/* ./addons/
echo "Merge https://github.com/OCA/account-financial-reporting.git to addonns/"
rm -rf account-financial-reporting

rm -rf server-ux
git clone -b 12.0 https://github.com/OCA/server-ux.git
(cd server-ux && tar c .) | (cd addons && tar xf -)
#mv server_ux/* ./addons/
echo "Merge https://github.com/OCA/server-ux.git to addonns/"
rm -rf server-ux

rm -rf crm
git clone -b 12.0 https://github.com/OCA/crm.git
(cd crm && tar c .) | (cd addons && tar xf -)
#mv crm/* ./addons/
echo "Merge https://github.com/OCA/crm.git to addonns/"
rm -rf crm

rm -rf odoo_publishers
git clone -b 12.0 https://github.com/matteopolleschi/odoo_publishers.git
#(cd odoo_publishers && tar c .) | (cd addons && tar xf -)
mv odoo_publishers ./addons/
echo "Merge https://github.com/matteopolleschi/odoo_publishers.git to addonns/"
#rsync -a odoo_publishers/ ./addons
#rm -rf odoo_publishers

#rm -rf l10n-italy-supplemental
#git clone -b 11.0 https://github.com/zeroincombenze/l10n-italy-supplemental.git
# mv l10n-italy-supplemental/l10n_it_* ./addons
#mv l10n-italy-supplemental/* ./addons
#rm -rf l10n-italy-supplemental

#rm -rf stock-logistics-workflow
#git clone -b 11.0 https://github.com/OCA/stock-logistics-workflow.git
#mv stock-logistics-workflow/stock* ./addons
#rm -rf stock-logistics-workflow

# rm -rf l10n-italy
# git clone -b 11.0-mig-l10n_it_ddt https://github.com/dcorio/l10n-italy.git
# mv l10n-italy/l10n_it_ddt ./addons
# rm -rf l10n-italy

#rm -rf odoo_imppn
#git clone -b 11.0 https://github.com/matteopolleschi/odoo_imppn.git
#mv odoo_imppn ./addons
#rm -rf odoo_imppn


python run_before_image_creation.py
