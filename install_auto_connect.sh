#!/bin/sh

echo "What is the APN?"
read carrierapn

cp -f reconnect_service qmi_reconnect.service
cp -f reconnect_sh qmi_reconnect.sh
# wget --no-check-certificate https://raw.githubusercontent.com/sixfab/Sixfab_QMI_Installer/master/reconnect_service -O qmi_reconnect.service
# wget --no-check-certificate https://raw.githubusercontent.com/sixfab/Sixfab_QMI_Installer/master/reconnect_sh -O qmi_reconnect.sh

sed -i "s/#APN/$carrierapn/" qmi_reconnect.sh

mv qmi_reconnect.sh /usr/src/
mv qmi_reconnect.service /etc/systemd/system/

systemctl daemon-reload
systemctl start qmi_reconnect.service
systemctl enable qmi_reconnect.service

echo "DONE"
