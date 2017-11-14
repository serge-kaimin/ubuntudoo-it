#!/bin/bash

rm -rf addons
rm -rf l10n_it*
mkdir addons

rm -rf l10n-italy
git clone -b 8.0 https://github.com/OCA/l10n-italy.git
mv l10n-italy/l10n_it_* ./addons
rm -rf l10n-italy

rm -rf l10n-italy-supplemental
git clone -b 8.0 https://github.com/zeroincombenze/l10n-italy-supplemental.git
mv l10n-italy-supplemental/l10n_it_* ./addons
rm -rf l10n-italy-supplemental

python run_before_image_creation.py