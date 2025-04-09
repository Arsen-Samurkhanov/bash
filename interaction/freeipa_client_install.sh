#! /bin/bash

#условие проверяюшее установлен ли сервис sssd если да то скрипт не исполняется
SERVICE_STATUS="$(systemctl status sssd | grep running)"
if [[ $SERVICE_STATUS = *"running"* ]]; then
   exit 0
fi

yum install ipa-client -y  # Установка пакетов ipa-client

# команда для подключения хоста к ipa-server
ipa-client-install --mkhomedir --force-join  --no-ntp --unattended  --domain dh.rt.ru --principal=admin@DH.RT.RU --password='womAB0SPl@^#&`l0`k6k' --server vm-infra-ipa-m-1.dh.rt.ru --server vm-infra-ipa-m-2.dh.rt.ru

HST="$(hostname -f)"

# конфиг для файла /etc/sssd/sssd.conf
SSSD_CONF=$(cat <<EOF
[domain/dh.rt.ru]

id_provider = ipa
ipa_server = _srv_, vm-infra-ipa-m-1.dh.rt.ru, vm-infra-ipa-m-2.dh.rt.ru
ipa_domain = dh.rt.ru
ipa_hostname = $HST
auth_provider = ipa
chpass_provider = ipa
access_provider = ipa
cache_credentials = True
ldap_tls_cacert = /etc/ipa/ca.crt
krb5_store_password_if_offline = True
subdomains_provider = ipa
[sssd]
services = nss, pam, ssh, sudo

domains = dh.rt.ru
[nss]
homedir_substring = /home

[pam]

[sudo]

[autofs]

[ssh]

[pac]

[ifp]

[secrets]

[session_recording]
EOF
)

# конфиг для файла /etc/sssd/sssd.conf
KRB5_CONF=$(cat <<EOF
#File modified by ipa-client-install

includedir /etc/krb5.conf.d/
includedir /var/lib/sss/pubconf/krb5.include.d/

[libdefaults]
  default_realm = DH.RT.RU
  dns_lookup_realm = true
  dns_lookup_kdc = true
  rdns = false
  dns_canonicalize_hostname = false
  ticket_lifetime = 24h
  forwardable = true
  udp_preference_limit = 0
  default_ccache_name = KEYRING:persistent:%{uid}


[realms]
  DH.RT.RU = {
    kdc = vm-infra-ipa-m-1.dh.rt.ru:88
    master_kdc = vm-infra-ipa-m-1.dh.rt.ru:88
    admin_server = vm-infra-ipa-m-1.dh.rt.ru:749
    kpasswd_server = vm-infra-ipa-m-1.dh.rt.ru:464
    kdc = vm-infra-ipa-m-2.dh.rt.ru:88
    master_kdc = vm-infra-ipa-m-2.dh.rt.ru:88
    admin_server = vm-infra-ipa-m-2.dh.rt.ru:749
    kpasswd_server = vm-infra-ipa-m-2.dh.rt.ru:464
    default_domain = dh.rt.ru
    pkinit_anchors = FILE:/var/lib/ipa-client/pki/kdc-ca-bundle.pem
    pkinit_pool = FILE:/var/lib/ipa-client/pki/ca-bundle.pem

  }


[domain_realm]
  .dh.rt.ru = DH.RT.RU
  dh.rt.ru = DH.RT.RU
  $HST = DH.RT.RU
EOF
)

# запись данных в конфиг файлы
echo "${SSSD_CONF}" > /etc/sssd/sssd.conf
echo "${KRB5_CONF}" > /etc/krb5.conf

systemctl restart sssd # Перезапуск сервиса sssd


